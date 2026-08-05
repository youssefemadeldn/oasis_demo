import 'package:intl/intl.dart';

/// Static date formatting helpers built on `intl`'s [DateFormat]. Every
/// method handles a `null` input gracefully, returning an empty string.
class DateFormatterHelper {
  const DateFormatterHelper._();

  static String formatDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('dd MMM yyyy').format(date);
  }

  static String formatDateTime(DateTime? date) {
    if (date == null) return '';
    return DateFormat('dd MMM yyyy • hh:mm a').format(date);
  }

  static String formatDayMonth(DateTime? date) {
    if (date == null) return '';
    return DateFormat('dd MMM').format(date);
  }

  static String formatMonthYear(DateTime? date) {
    if (date == null) return '';
    return DateFormat('MMM yyyy').format(date);
  }

  static String formatTimeAgo(DateTime? date) {
    if (date == null) return '';

    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inSeconds < 60) return 'just now';
    if (diff.inMinutes < 60) {
      return '${diff.inMinutes} minute${diff.inMinutes == 1 ? '' : 's'} ago';
    }
    if (diff.inHours < 24) {
      return '${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago';
    }
    if (diff.inDays == 1) return 'yesterday';
    if (diff.inDays < 7) return '${diff.inDays} days ago';

    return formatDate(date);
  }
}
