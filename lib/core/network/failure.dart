import 'package:equatable/equatable.dart';

/// Base class for every mapped network/domain error.
///
/// [errorCode] is an optional, stable, non-localized code the backend may
/// send alongside `message` (e.g. `"Auth.InvalidCredentials"`) — for cubits
/// to branch on *behavior* instead of matching display text. Not every
/// backend/endpoint sends one, so it is always nullable.
abstract class Failure extends Equatable {
  final String? errorCode;

  const Failure({this.errorCode});

  @override
  List<Object?> get props => [errorCode];
}

class ServerFailure extends Failure {
  final int statusCode;
  final String message;

  const ServerFailure({
    required this.statusCode,
    required this.message,
    super.errorCode,
  });

  @override
  List<Object?> get props => [statusCode, message, errorCode];
}

class NetworkFailure extends Failure {
  const NetworkFailure();
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({super.errorCode});
}

class CacheFailure extends Failure {
  const CacheFailure();
}

class ValidationFailure extends Failure {
  final String message;

  const ValidationFailure(this.message, {super.errorCode});

  @override
  List<Object?> get props => [message, errorCode];
}

class UnexpectedFailure extends Failure {
  final String message;

  const UnexpectedFailure(this.message);

  @override
  List<Object?> get props => [message, errorCode];
}
