import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_font_weight.dart';
import '../theme/app_text_styles.dart';

/// Tone — mirrors `Tag.jsx`'s `tone` prop.
enum DsTagTone { neutral, brand, dark }

/// Oasis Design System tag. Built from
/// `doc/design/Oasis Design System/components/core/Tag.jsx`.
class DsTag extends StatelessWidget {
  final String label;
  final DsTagTone tone;

  const DsTag({super.key, required this.label, this.tone = DsTagTone.neutral});

  Color get _background => switch (tone) {
        DsTagTone.neutral => AppColors.inputFill,
        DsTagTone.brand => AppColors.brandSoft,
        DsTagTone.dark => AppColors.surfaceDarkElevated,
      };

  Color get _foreground => switch (tone) {
        DsTagTone.neutral => AppColors.textSecondary,
        DsTagTone.brand => AppColors.brandStrong,
        DsTagTone.dark => AppColors.textOnDark,
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: _background,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        label.toUpperCase(),
        style: AppTextStyles.labelSmall.copyWith(
          color: _foreground,
          fontWeight: AppFontWeight.semiBold,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
