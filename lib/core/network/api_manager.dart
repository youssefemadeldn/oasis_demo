import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'api_result.dart';
import 'failure.dart';

/// `T Function(Object? json)` — never `dynamic`. Callers cast explicitly at
/// the boundary, e.g. `(json) => Foo.fromJson(json as Map<String, dynamic>)`.
typedef JsonMapper<T> = T Function(Object? json);

// If backend wraps responses in { "success": true, "data": {...} }, create
// api_envelope.dart — see feature guide §11.

/// Sole error boundary in the app. Converts every [DioException] to
/// `Either<Failure, T>`; never throws.
///
/// Conversion chain: DioResponse → [ApiResult] → `Either<Failure, T>`.
@lazySingleton
class ApiManager {
  final Dio _dio;

  ApiManager(this._dio);

  Future<Either<Failure, T>> get<T>({
    required String path,
    required JsonMapper<T> fromJson,
    Map<String, dynamic>? queryParameters,
  }) =>
      _request<T>(
        () => _dio.get(path, queryParameters: queryParameters),
        fromJson,
      );

  Future<Either<Failure, T>> post<T>({
    required String path,
    required JsonMapper<T> fromJson,
    Object? data,
  }) =>
      _request<T>(() => _dio.post(path, data: data), fromJson);

  Future<Either<Failure, T>> put<T>({
    required String path,
    required JsonMapper<T> fromJson,
    Object? data,
  }) =>
      _request<T>(() => _dio.put(path, data: data), fromJson);

  Future<Either<Failure, T>> patch<T>({
    required String path,
    required JsonMapper<T> fromJson,
    Object? data,
  }) =>
      _request<T>(() => _dio.patch(path, data: data), fromJson);

  Future<Either<Failure, T>> delete<T>({
    required String path,
    required JsonMapper<T> fromJson,
    Object? data,
  }) =>
      _request<T>(() => _dio.delete(path, data: data), fromJson);

  Future<Either<Failure, T>> _request<T>(
    Future<Response> Function() call,
    JsonMapper<T> fromJson,
  ) async {
    final result = await _safeCall<T>(call, fromJson);
    return switch (result) {
      ApiSuccess<T>(data: final data) => Right(data),
      ApiFailure<T>(failure: final failure) => Left(failure),
    };
  }

  Future<ApiResult<T>> _safeCall<T>(
    Future<Response> Function() call,
    JsonMapper<T> fromJson,
  ) async {
    try {
      final response = await call();
      return ApiSuccess(fromJson(response.data));
    } on DioException catch (e) {
      return ApiFailure(_mapDioError(e));
    } catch (e) {
      return ApiFailure(UnexpectedFailure(e.toString()));
    }
  }

  Failure _mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const NetworkFailure();
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        if (statusCode == null) {
          return UnexpectedFailure(e.message ?? 'Unexpected error');
        }
        if (statusCode == 401) {
          return UnauthorizedFailure(errorCode: _extractErrorCode(e));
        }
        return ServerFailure(
          statusCode: statusCode,
          message: _extractMessage(e) ?? e.message ?? 'Server error',
          errorCode: _extractErrorCode(e),
        );
      case DioExceptionType.cancel:
        return UnexpectedFailure(e.message ?? 'Request cancelled');
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
      default:
        return UnexpectedFailure(e.message ?? 'Unexpected error');
    }
  }

  String? _extractMessage(DioException e) {
    final body = e.response?.data;
    if (body is Map && body['message'] is String) {
      return body['message'] as String;
    }
    return null;
  }

  /// Reads `errorCode` from the error body defensively — a non-Map body, a
  /// missing key, or a non-string value all resolve to `null`.
  String? _extractErrorCode(DioException e) {
    final body = e.response?.data;
    if (body is! Map) return null;
    final code = body['errorCode'];
    return code is String ? code : null;
  }
}
