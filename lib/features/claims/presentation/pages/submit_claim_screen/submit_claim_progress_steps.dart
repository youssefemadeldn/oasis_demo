import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_weight.dart';
import '../../../../../core/theme/app_text_styles.dart';

const List<String> _kStepLabelKeys = [
  'submitClaim.step.policy',
  'submitClaim.step.details',
  'submitClaim.step.documents',
  'submitClaim.step.review',
];

/// 4-circle/connector wizard header.
class SubmitClaimProgressSteps extends StatelessWidget {
  final int currentStep;

  const SubmitClaimProgressSteps({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.w, 16.h, 24.w, 4.h),
      child: Row(
        children: List.generate(_kStepLabelKeys.length, (i) {
          final stepNumber = i + 1;
          final isDone = currentStep > stepNumber;
          final isActive = currentStep == stepNumber;
          final circleColor =
              isDone || isActive ? AppColors.primary : AppColors.divider;
          return Expanded(
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 26.w,
                      height: 26.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: circleColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$stepNumber',
                        style: AppTextStyles.labelLarge.copyWith(
                          color: isDone || isActive
                              ? AppColors.surface
                              : AppColors.textHint,
                          fontWeight: AppFontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      _kStepLabelKeys[i].tr(),
                      style: AppTextStyles.labelSmall.copyWith(
                        color: isActive
                            ? AppColors.primary
                            : isDone
                                ? AppColors.textSecondary
                                : AppColors.textHint,
                        fontWeight: isActive
                            ? AppFontWeight.bold
                            : AppFontWeight.medium,
                      ),
                    ),
                  ],
                ),
                if (stepNumber < _kStepLabelKeys.length)
                  Expanded(
                    child: Container(
                      height: 2.h,
                      margin: EdgeInsetsDirectional.symmetric(horizontal: 4.w),
                      color: isDone ? AppColors.primary : AppColors.divider,
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
