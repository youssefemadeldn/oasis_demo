import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/args/claim_detail_args.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font_weight.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/ds_card.dart';
import '../../../../core/widgets/ds_status_badge.dart';
import '../../../../core/widgets/ds_toast.dart';
import '../../../../core/widgets/ds_top_bar.dart';
import '../../../../core/widgets/icons/ds_icons.dart';
import 'claims_mock_data.dart';

class _TimelineStep {
  final String labelKey;
  final bool isActive;
  final bool isDone;
  final bool isLast;

  const _TimelineStep({
    required this.labelKey,
    required this.isActive,
    required this.isDone,
    required this.isLast,
  });
}

/// Claim Status — routing target for [AppRoutes.claimDetail]. Progress
/// timeline logic mirrors the prototype's `timelineSteps` derivation.
class ClaimDetailScreen extends StatelessWidget {
  final ClaimDetailArgs args;

  const ClaimDetailScreen({super.key, required this.args});

  List<_TimelineStep> _buildTimeline(Claim claim) {
    final isRejected = claim.status == ClaimStatus.rejected;
    final labels = [
      'claimDetail.timeline.submitted',
      'claimDetail.timeline.underReview',
      'claimDetail.timeline.processing',
      isRejected
          ? 'claimDetail.timeline.rejected'
          : 'claimDetail.timeline.approved',
    ];
    var activeIndex = 1;
    if (claim.status == ClaimStatus.processing) {
      activeIndex = 2;
    } else if ([
      ClaimStatus.closed,
      ClaimStatus.invoiced,
      ClaimStatus.rejected,
    ].contains(claim.status)) {
      activeIndex = 3;
    }
    return List.generate(labels.length, (i) {
      return _TimelineStep(
        labelKey: labels[i],
        isActive: i == activeIndex,
        isDone: i <= activeIndex,
        isLast: i == labels.length - 1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final claim = kClaims.firstWhere((c) => c.id == args.claimId);
    final timeline = _buildTimeline(claim);
    final isRejected = claim.status == ClaimStatus.rejected;
    final isInvoiced = claim.status == ClaimStatus.invoiced;

    return Scaffold(
      appBar: DsTopBar(
        title: 'claimDetail.title'.tr(),
        onBack: () => context.pop(),
      ),
      body: SafeArea(
        top: false,
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
                            claim.line,
                            style: AppTextStyles.titleLarge.copyWith(
                              fontWeight: AppFontWeight.bold,
                            ),
                          ),
                        ),
                        DsStatusBadge(status: claim.status),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'claimDetail.claimAndPolicy'
                          .tr(args: [claim.id, claim.policyId]),
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      claim.amount,
                      style: AppTextStyles.headlineSmall.copyWith(
                        color: AppColors.primary,
                        fontWeight: AppFontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.h),
              DsCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'claimDetail.progress'.tr(),
                      style: AppTextStyles.bodySmall.copyWith(
                        fontWeight: AppFontWeight.semiBold,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    ...timeline.map(
                      (step) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 12.w,
                                height: 12.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: !step.isDone
                                      ? AppColors.divider
                                      : (step.isLast && isRejected)
                                          ? AppColors.statusRejectedFg
                                          : AppColors.primary,
                                ),
                              ),
                              if (!step.isLast)
                                Container(
                                  width: 2.w,
                                  height: 26.h,
                                  color: step.isDone
                                      ? AppColors.primary
                                      : AppColors.divider,
                                ),
                            ],
                          ),
                          SizedBox(width: 10.w),
                          Padding(
                            padding: EdgeInsetsDirectional.only(bottom: 14.h),
                            child: Text(
                              step.labelKey.tr(),
                              style: AppTextStyles.bodySmall.copyWith(
                                color: step.isDone
                                    ? AppColors.textPrimary
                                    : AppColors.textHint,
                                fontWeight: step.isActive
                                    ? AppFontWeight.bold
                                    : AppFontWeight.regular,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.h),
              Text(
                'claimDetail.documents'.tr(),
                style: AppTextStyles.bodySmall.copyWith(
                  fontWeight: AppFontWeight.semiBold,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: List.generate(2, (i) {
                  return Padding(
                    padding: EdgeInsetsDirectional.only(end: 10.w),
                    child: Container(
                      width: 76.w,
                      height: 76.w,
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        border: Border.all(color: AppColors.divider),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DsIcon.gallery(color: AppColors.textHint),
                          SizedBox(height: 4.h),
                          Text(
                            'IMG_204${i + 1}.jpg',
                            style: AppTextStyles.labelSmall,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              if (isRejected) ...[
                SizedBox(height: 14.h),
                DsToast(
                  tone: DsToastTone.error,
                  message: 'claimDetail.rejectedToast'.tr(),
                ),
              ],
              if (isInvoiced) ...[
                SizedBox(height: 14.h),
                DsToast(
                  tone: DsToastTone.success,
                  message: 'claimDetail.invoicedToast'.tr(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
