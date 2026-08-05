import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_weight.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/ds_card.dart';

/// Step 4 — read-only review before submit.
class SubmitClaimStep4Review extends StatelessWidget {
  final String policyId;
  final String claimType;
  final String description;
  final int attachmentCount;

  const SubmitClaimStep4Review({
    super.key,
    required this.policyId,
    required this.claimType,
    required this.description,
    required this.attachmentCount,
  });

  Widget _row(String labelKey, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(labelKey.tr(), style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.textSecondary,
        )),
        Text(
          value,
          style: AppTextStyles.bodySmall.copyWith(
            fontWeight: AppFontWeight.medium,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'submitClaim.reviewIntro'.tr(),
          style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
        ),
        SizedBox(height: 12.h),
        DsCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _row('submitClaim.reviewPolicy', policyId),
              SizedBox(height: 10.h),
              _row('submitClaim.claimTypeLabel', claimType),
              SizedBox(height: 10.h),
              Text(
                'submitClaim.descriptionLabel'.tr(),
                style: AppTextStyles.bodySmall
                    .copyWith(color: AppColors.textSecondary),
              ),
              SizedBox(height: 4.h),
              Text(description, style: AppTextStyles.bodySmall),
              SizedBox(height: 10.h),
              _row(
                'submitClaim.reviewAttachments',
                'submitClaim.fileCount'.tr(args: ['$attachmentCount']),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
