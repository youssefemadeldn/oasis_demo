import 'dart:async';

import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';

import '../../constants/api_constants.dart';
import '../../storage/secure_storage_helper.dart';

/// Handles Bearer token injection and silent token refresh on 401.
///
/// Receives [SecureStorageHelper] and [GoRouter] via constructor injection
/// — never looked up via `getIt` inside the interceptor, to avoid a
/// circular dependency (see `flutter_scaffold_prompt.md` edge case #3).
///
/// The refresh call runs on a second, interceptor-free "bare" [Dio] so it
/// can never recurse back into this interceptor. Concurrent 401s share one
/// in-flight refresh via a [Completer] instead of each firing its own
/// network call.
///
/// Note — backend response envelope not yet confirmed (no backend exists
/// yet, see `ApiManager`'s marker comment): the refresh response is parsed
/// as a flat `{ accessToken, refreshToken }` JSON object. If the backend
/// later adopts a `{ success, data }` envelope, wrap this parse with
/// `unwrapServiceResult` once `api_envelope.dart` is created.
class AuthInterceptor extends Interceptor {
  final SecureStorageHelper _storage;
  final GoRouter _router;
  final Dio _bareDio;

  Completer<String?>? _refreshCompleter;

  AuthInterceptor(this._storage, this._router)
      : _bareDio = Dio(
          BaseOptions(
            baseUrl: ApiConstants.baseUrl,
            connectTimeout: ApiConstants.connectTimeout,
            receiveTimeout: ApiConstants.receiveTimeout,
            sendTimeout: ApiConstants.sendTimeout,
          ),
        );

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      handler.next(err);
      return;
    }

    final isRefreshCallItself =
        err.requestOptions.path == ApiConstants.refreshToken;
    if (isRefreshCallItself) {
      await _logout();
      handler.next(err);
      return;
    }

    final newToken = await _refreshToken();
    if (newToken == null) {
      await _logout();
      handler.next(err);
      return;
    }

    try {
      final retryOptions = err.requestOptions
        ..headers['Authorization'] = 'Bearer $newToken';
      final response = await _bareDio.fetch(retryOptions);
      handler.resolve(response);
    } on DioException catch (e) {
      handler.next(e);
    }
  }

  /// Shares one in-flight refresh across concurrent 401s.
  Future<String?> _refreshToken() {
    final inFlight = _refreshCompleter;
    if (inFlight != null) return inFlight.future;

    final completer = Completer<String?>();
    _refreshCompleter = completer;
    _performRefresh().then(completer.complete).whenComplete(() {
      _refreshCompleter = null;
    });
    return completer.future;
  }

  Future<String?> _performRefresh() async {
    final refreshToken = await _storage.getRefreshToken();
    if (refreshToken == null) return null;

    try {
      final response = await _bareDio.post(
        ApiConstants.refreshToken,
        data: {'refreshToken': refreshToken},
      );
      final data = response.data;
      if (data is! Map) return null;

      final accessToken = data['accessToken'];
      final newRefreshToken = data['refreshToken'];
      if (accessToken is! String || newRefreshToken is! String) return null;

      await _storage.saveToken(accessToken);
      await _storage.saveRefreshToken(newRefreshToken);
      return accessToken;
    } on DioException {
      return null;
    }
  }

  Future<void> _logout() async {
    await _storage.deleteToken();
    await _storage.deleteRefreshToken();
    // Path-based — AppRoutes only holds route names; `.go` needs a
    // location. Must match app_router.dart's login route path.
    _router.go('/login');
  }
}
