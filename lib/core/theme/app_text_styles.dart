import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_font_weight.dart';

/// Oasis Design System text styles.
///
/// Sizes/weights/line-heights sourced from
/// `doc/design/Oasis Design System/tokens/typography.css`. Display/headline
/// styles use Poppins (brand headline face); title/body/label styles use
/// Inter (brand UI face).
///
/// Uses `static get` (not `static const`) because `.sp` reads
/// [ScreenUtil]'s initialized instance — evaluating at class-level static
/// init would crash. Only call these from inside a `build()` method or
/// another lazy getter.
class AppTextStyles {
  const AppTextStyles._();

  static TextStyle get displayLarge => GoogleFonts.poppins(
        fontSize: 40.sp,
        fontWeight: AppFontWeight.extraBold,
        height: 1.15,
        color: AppColors.textPrimary,
      );

  static TextStyle get displayMedium => GoogleFonts.poppins(
        fontSize: 32.sp,
        fontWeight: AppFontWeight.bold,
        height: 1.15,
        color: AppColors.textPrimary,
      );

  static TextStyle get headlineLarge => GoogleFonts.poppins(
        fontSize: 26.sp,
        fontWeight: AppFontWeight.semiBold,
        height: 1.15,
        color: AppColors.textPrimary,
      );

  static TextStyle get headlineMedium => GoogleFonts.poppins(
        fontSize: 22.sp,
        fontWeight: AppFontWeight.semiBold,
        height: 1.3,
        color: AppColors.textPrimary,
      );

  static TextStyle get headlineSmall => GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: AppFontWeight.medium,
        height: 1.3,
        color: AppColors.textPrimary,
      );

  static TextStyle get titleLarge => GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: AppFontWeight.semiBold,
        height: 1.3,
        color: AppColors.textPrimary,
      );

  static TextStyle get titleMedium => GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: AppFontWeight.medium,
        height: 1.3,
        color: AppColors.textPrimary,
      );

  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: AppFontWeight.regular,
        height: 1.5,
        color: AppColors.textPrimary,
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: AppFontWeight.regular,
        height: 1.5,
        color: AppColors.textPrimary,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 13.sp,
        fontWeight: AppFontWeight.regular,
        height: 1.5,
        color: AppColors.textSecondary,
      );

  static TextStyle get labelLarge => GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: AppFontWeight.medium,
        height: 1.3,
        color: AppColors.textSecondary,
      );

  static TextStyle get labelSmall => GoogleFonts.inter(
        fontSize: 11.sp,
        fontWeight: AppFontWeight.medium,
        height: 1.3,
        color: AppColors.textHint,
      );
}
