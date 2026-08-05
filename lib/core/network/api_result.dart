import 'failure.dart';

/// Internal transport sealed class — the raw HTTP outcome before mapping to
/// `Either<Failure, T>`. Imported only by [ApiManager]; never exposed to any
/// feature, cubit, or repository.
sealed class ApiResult<T> {
  const ApiResult();
}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;

  const ApiSuccess(this.data);
}

class ApiFailure<T> extends ApiResult<T> {
  final Failure failure;

  const ApiFailure(this.failure);
}
