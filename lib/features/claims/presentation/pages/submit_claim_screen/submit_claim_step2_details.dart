import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_weight.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/ds_select.dart';
import 'submit_claim_mock_data.dart';

/// Step 2 — claim type + description.
class SubmitClaimStep2Details extends StatelessWidget {
  final String policyLine;
  final String policyId;
  final String? claimType;
  final ValueChanged<String?> onClaimTypeChanged;
  final TextEditingController descriptionController;

  const SubmitClaimStep2Details({
    super.key,
    required this.policyLine,
    required this.policyId,
    required this.claimType,
    required this.onClaimTypeChanged,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'submitClaim.filingFor'.tr(args: [policyLine, policyId]),
          style: AppTextStyles.labelLarge,
        ),
        SizedBox(height: 12.h),
        DsSelect(
          label: 'submitClaim.claimTypeLabel'.tr(),
          options: kClaimTypes,
          value: claimType,
          onChanged: onClaimTypeChanged,
        ),
        SizedBox(height: 14.h),
        Text(
          'submitClaim.descriptionLabel'.tr(),
          style: AppTextStyles.bodySmall
              .copyWith(fontWeight: AppFontWeight.medium),
        ),
        SizedBox(height: 6.h),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.divider, width: 1.5),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: TextField(
            controller: descriptionController,
            maxLines: 4,
            style: AppTextStyles.bodyMedium,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  EdgeInsetsDirectional.symmetric(horizontal: 14.w, vertical: 10.h),
              hintText: 'submitClaim.descriptionHint'.tr(),
              hintStyle:
                  AppTextStyles.bodyMedium.copyWith(color: AppColors.textHint),
            ),
          ),
        ),
      ],
    );
  }
}
