import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/api_constants.dart';
import '../storage/secure_storage_helper.dart';
import 'interceptors/auth_interceptor.dart';

/// Produces the app's [Dio] singleton.
///
/// Interceptor order is mandatory: `PrettyDioLogger` (debug builds only)
/// first, then [AuthInterceptor] — logging before the auth header is
/// attached would leak the bearer token into debug logs.
@lazySingleton
class DioFactory {
  final SecureStorageHelper _storage;
  final GoRouter _router;

  DioFactory(this._storage, this._router);

  Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        sendTimeout: ApiConstants.sendTimeout,
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(requestHeader: true, requestBody: true),
      );
    }

    dio.interceptors.add(AuthInterceptor(_storage, _router));

    return dio;
  }
}
