/// App-wide design tokens and storage keys.
class AppConstants {
  const AppConstants._();

  // ScreenUtil design canvas — iPhone 14 base, portrait only.
  static const double kDesignWidth = 390.0;
  static const double kDesignHeight = 844.0;

  static const String kAppName = 'Oasis';

  // Motion — matches the Oasis Design System's standard easing durations.
  static const Duration kAnimationDurationFast = Duration(milliseconds: 120);
  static const Duration kAnimationDuration = Duration(milliseconds: 200);
  static const Duration kSplashDuration = Duration(seconds: 2);

  static const int kDefaultPageSize = 20;

  // Secure storage keys.
  static const String kTokenKey = 'token';
  static const String kRefreshTokenKey = 'refresh_token';
  static const String kUserKey = 'user';

  // Brand assets — copied from doc/design/Oasis Design System/assets/.
  static const String kLogoFull = 'assets/images/logo_full.png';
  static const String kLogoMark = 'assets/images/logo_mark.jpeg';
}
