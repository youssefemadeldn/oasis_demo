/// Env-aware API base URL, timeouts, and endpoint paths.
///
/// Environment is resolved at compile time via
/// `--dart-define=ENVIRONMENT=prod` (defaults to `dev`).
class ApiConstants {
  const ApiConstants._();

  static const String _environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'dev',
  );

  static const String _devBaseUrl = 'https://api-dev.placeholder.com/v1';
  static const String _prodBaseUrl = 'https://api.placeholder.com/v1';

  static String get baseUrl =>
      _environment == 'prod' ? _prodBaseUrl : _devBaseUrl;

  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

  // Endpoint paths.
  static const String login = '/auth/login';
  static const String refreshToken = '/auth/refresh-token';
  static const String logout = '/auth/logout';
}
