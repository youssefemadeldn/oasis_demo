import 'package:flutter/material.dart';

/// Oasis Design System color tokens.
///
/// Sourced from `doc/design/Oasis Design System/tokens/colors.css`. Pure
/// constants, no logic.
class AppColors {
  const AppColors._();

  // Brand.
  static const Color primary = Color(0xFF29ABE2); // --blue-400
  static const Color primaryDark = Color(0xFF1B93C9); // --blue-500
  static const Color secondary = Color(0xFF1E3550); // --navy-600

  // Semantic.
  static const Color error = Color(0xFFC0392B); // --status-rejected-fg
  static const Color success = Color(0xFF1C7A3C); // --status-closed-fg
  static const Color warning = Color(0xFF9A6B00); // --status-pending-fg

  // Surfaces.
  static const Color background = Color(0xFFF7F9FB); // --gray-50
  static const Color surface = Color(0xFFFFFFFF); // --gray-0
  static const Color cardBackground = Color(0xFFFFFFFF); // --gray-0

  // Dark marketing surfaces — splash, onboarding, login header, home header.
  static const Color surfaceDark = Color(0xFF0A1420); // --navy-900
  static const Color surfaceDarkElevated = Color(0xFF16293C); // --navy-700
  static const Color textOnDark = Color(0xFFEEF4FA); // --text-on-dark
  static const Color textOnDarkMuted = Color(0xFFA9B8C8); // --text-on-dark-muted

  // Brand soft — badge/tag backgrounds needing the true token instead of an
  // alpha-blended approximation.
  static const Color brandSoft = Color(0xFFEAF7FD); // --blue-50
  static const Color brandStrong = Color(0xFF1477A3); // --blue-600

  // Text.
  static const Color textPrimary = Color(0xFF141920); // --gray-900
  static const Color textSecondary = Color(0xFF535D68); // --gray-600
  static const Color textHint = Color(0xFF9AA5B1); // --gray-400

  // Structural.
  static const Color divider = Color(0xFFE2E6EC); // --gray-200
  static const Color shimmerBase = Color(0xFFE2E6EC); // --gray-200
  static const Color shimmerHighlight = Color(0xFFEEF1F5); // --gray-100
  static const Color inputFill = Color(0xFFEEF1F5); // --gray-100

  // Status badges — mirrors the desktop products' claim/lead status
  // vocabulary (pending/closed/rejected/processing/invoiced/cancelled).
  static const Color statusPendingBg = Color(0xFFFFF4D6);
  static const Color statusPendingFg = Color(0xFF9A6B00);

  static const Color statusClosedBg = Color(0xFFDFF5E6);
  static const Color statusClosedFg = Color(0xFF1C7A3C);

  static const Color statusRejectedBg = Color(0xFFFDE2E1);
  static const Color statusRejectedFg = Color(0xFFC0392B);

  static const Color statusProcessingBg = Color(0xFFFFE8D1);
  static const Color statusProcessingFg = Color(0xFFB15B00);

  static const Color statusInvoicedBg = Color(0xFFE6EAFF);
  static const Color statusInvoicedFg = Color(0xFF3D4FD6);

  static const Color statusCancelledBg = Color(0xFFEEF1F5);
  static const Color statusCancelledFg = Color(0xFF5C6773);
}
