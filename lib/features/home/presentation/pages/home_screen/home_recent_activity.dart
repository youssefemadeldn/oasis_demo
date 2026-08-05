import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/router/app_routes.dart';
import '../../../../../core/router/args/claim_detail_args.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_weight.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/ds_card.dart';
import '../../../../../core/widgets/ds_status_badge.dart';
import 'home_mock_data.dart';

/// Recent claims list — tap deep-links into Claim Detail.
class HomeRecentActivity extends StatelessWidget {
  const HomeRecentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'home.recentActivity'.tr(),
          style: AppTextStyles.titleMedium.copyWith(
            fontWeight: AppFontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),
        ...kHomeRecentClaims.map(
          (claim) => Padding(
            padding: EdgeInsetsDirectional.only(bottom: 10.h),
            child: DsCard(
              onTap: () => context.pushNamed(
                AppRoutes.claimDetail,
                extra: ClaimDetailArgs(claimId: claim.id),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          claim.line,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontWeight: AppFontWeight.semiBold,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          '${claim.id} · ${claim.date}',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  DsStatusBadge(status: claim.status),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
