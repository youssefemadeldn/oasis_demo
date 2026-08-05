import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_weight.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/icons/ds_icons.dart';
import 'submit_claim_mock_data.dart';

/// Step 1 — pick the policy this claim relates to.
class SubmitClaimStep1Policy extends StatelessWidget {
  final String? selectedPolicyId;
  final ValueChanged<String> onSelect;

  const SubmitClaimStep1Policy({
    super.key,
    required this.selectedPolicyId,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('submitClaim.choosePolicy'.tr(), style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.textSecondary,
        )),
        SizedBox(height: 12.h),
        ...kSubmitClaimPolicyOptions.map((policy) {
          final selected = policy.id == selectedPolicyId;
          return Padding(
            padding: EdgeInsetsDirectional.only(bottom: 10.h),
            child: InkWell(
              onTap: () => onSelect(policy.id),
              borderRadius: BorderRadius.circular(16.r),
              child: Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: selected ? AppColors.primary : AppColors.divider,
                    width: selected ? 1.5 : 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            policy.line,
                            style: AppTextStyles.bodyMedium.copyWith(
                              fontWeight: AppFontWeight.semiBold,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            policy.id,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (selected) DsIcon.checkCircle(),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
