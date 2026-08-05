import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_weight.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'home_mock_data.dart';

/// Active Policies / Open Claims stat cards.
class HomeStatsRow extends StatelessWidget {
  const HomeStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [AppColors.surfaceDark, AppColors.primaryDark],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'home.activePolicies'.tr(),
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.textOnDarkMuted,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  '$kHomeActivePoliciesCount',
                  style: AppTextStyles.headlineLarge.copyWith(
                    color: AppColors.surface,
                    fontWeight: AppFontWeight.extraBold,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              border: Border.all(color: AppColors.divider),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'home.openClaims'.tr(),
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  '$kHomeOpenClaimsCount',
                  style: AppTextStyles.headlineLarge.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: AppFontWeight.extraBold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
