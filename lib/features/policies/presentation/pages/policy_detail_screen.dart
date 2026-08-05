import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/router/args/policy_detail_args.dart';
import '../../../../core/router/args/submit_claim_args.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font_weight.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/ds_button.dart';
import '../../../../core/widgets/ds_card.dart';
import '../../../../core/widgets/ds_tag.dart';
import '../../../../core/widgets/ds_top_bar.dart';
import '../../../../core/widgets/icons/ds_icons.dart';
import 'policies_mock_data.dart';

/// Policy Details — routing target for [AppRoutes.policyDetail].
class PolicyDetailScreen extends StatelessWidget {
  final PolicyDetailArgs args;

  const PolicyDetailScreen({super.key, required this.args});

  Widget _row(String labelKey, String value) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(labelKey.tr(), style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textSecondary,
          )),
          Text(
            value,
            style: AppTextStyles.bodySmall.copyWith(
              fontWeight: AppFontWeight.medium,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final policy = kPolicies.firstWhere((p) => p.id == args.policyId);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DsTopBar(
              title: 'policyDetail.title'.tr(),
              onBack: () => context.pop(),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DsCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  policy.line,
                                  style: AppTextStyles.titleLarge.copyWith(
                                    fontWeight: AppFontWeight.bold,
                                  ),
                                ),
                              ),
                              DsTag(label: policy.tagKey.tr(), tone: policy.tagTone),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            policy.id,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          _row('policyDetail.branch', policy.branch),
                          _row('policyDetail.effectiveDate', policy.start),
                          _row('policyDetail.expiryDate', policy.expiry),
                          _row('policyDetail.premium', policy.premium),
                        ],
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Text(
                      'policyDetail.documents'.tr(),
                      style: AppTextStyles.bodySmall.copyWith(
                        fontWeight: AppFontWeight.semiBold,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    DsCard(
                      padded: false,
                      child: Column(
                        children: policy.docs
                            .map(
                              (doc) => Container(
                                padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: 16.w,
                                  vertical: 12.h,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: AppColors.divider),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    DsIcon.file(),
                                    SizedBox(width: 10.w),
                                    Expanded(
                                      child: Text(doc, style: AppTextStyles.bodySmall),
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: AppColors.textHint,
                                      size: 18.w,
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    SizedBox(height: 18.h),
                    DsButton(
                      label: 'policyDetail.submitClaimOnPolicy'.tr(),
                      full: true,
                      onPressed: () => context.pushNamed(
                        AppRoutes.submitClaim,
                        extra: SubmitClaimArgs(
                          policyId: policy.id,
                          policyLine: policy.line,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
