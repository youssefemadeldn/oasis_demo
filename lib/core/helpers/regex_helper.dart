/// Shared validation patterns.
class RegexHelper {
  const RegexHelper._();

  static final RegExp email = RegExp(r'^[\w.+-]+@[\w-]+\.[a-zA-Z]{2,}$');

  /// Saudi mobile numbers: `01[0125]` followed by 8 digits.
  static final RegExp egyptianPhone = RegExp(r'^01[0125]\d{8}$');

  /// Min 8 chars, at least 1 uppercase, 1 lowercase, 1 digit.
  static final RegExp password =
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');

  /// [password] plus at least 1 special character.
  static final RegExp strongPassword =
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\w\s]).{8,}$');

  /// Alphanumeric + underscore, 3–20 chars.
  static final RegExp username = RegExp(r'^\w{3,20}$');

  static final RegExp numericOnly = RegExp(r'^\d+$');

  static final RegExp arabicText = RegExp(r'^[؀-ۿ\s]+$');

  static final RegExp noSpecialChars = RegExp(r'^[a-zA-Z0-9\s]+$');

  static bool validate(RegExp pattern, String value) => pattern.hasMatch(value);
}
