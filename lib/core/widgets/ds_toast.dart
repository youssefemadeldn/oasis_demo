import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_font_weight.dart';
import '../theme/app_text_styles.dart';

/// Tone — mirrors `Toast.jsx`'s `tone` prop.
enum DsToastTone { success, error, info }

/// Oasis Design System inline banner (not a `SnackBar` — rendered in-flow,
/// matching `doc/design/Oasis Design System/components/core/Toast.jsx`).
class DsToast extends StatelessWidget {
  final String message;
  final DsToastTone tone;

  const DsToast({super.key, required this.message, this.tone = DsToastTone.info});

  Color get _background => switch (tone) {
        DsToastTone.success => AppColors.statusClosedBg,
        DsToastTone.error => AppColors.statusRejectedBg,
        DsToastTone.info => AppColors.brandSoft,
      };

  Color get _foreground => switch (tone) {
        DsToastTone.success => AppColors.statusClosedFg,
        DsToastTone.error => AppColors.statusRejectedFg,
        DsToastTone.info => AppColors.brandStrong,
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: _background,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F1E2E).withValues(alpha: 0.08),
            blurRadius: 12.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Text(
        message,
        style: AppTextStyles.bodySmall.copyWith(
          color: _foreground,
          fontWeight: AppFontWeight.medium,
        ),
      ),
    );
  }
}
