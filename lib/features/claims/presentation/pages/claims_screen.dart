import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/router/args/claim_detail_args.dart';
import '../../../../core/router/args/claims_args.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font_weight.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/ds_bottom_nav.dart';
import '../../../../core/widgets/ds_button.dart';
import '../../../../core/widgets/ds_card.dart';
import '../../../../core/widgets/ds_status_badge.dart';
import '../../../../core/widgets/ds_toast.dart';
import '../../../../core/widgets/ds_top_bar.dart';
import 'claims_mock_data.dart';

/// Claims list — routing target for [AppRoutes.claims].
class ClaimsScreen extends StatelessWidget {
  final ClaimsArgs args;

  const ClaimsScreen({super.key, this.args = const ClaimsArgs()});

  void _onTabChanged(BuildContext context, DsBottomNavTab tab) {
    switch (tab) {
      case DsBottomNavTab.home:
        context.goNamed(AppRoutes.home);
      case DsBottomNavTab.policies:
        context.goNamed(AppRoutes.policies);
      case DsBottomNavTab.claims:
        return;
      case DsBottomNavTab.profile:
        context.goNamed(AppRoutes.profile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DsTopBar(title: 'claims.title'.tr()),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.w, 12.h, 16.w, 0),
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: DsButton(
                  label: 'claims.newClaim'.tr(),
                  size: DsButtonSize.sm,
                  onPressed: () => context.pushNamed(AppRoutes.submitClaim),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.r),
                children: [
                  if (args.justSubmitted) ...[
                    DsToast(
                      tone: DsToastTone.success,
                      message: 'claims.submittedToast'.tr(),
                    ),
                    SizedBox(height: 12.h),
                  ],
                  ...kClaims.map(
                    (claim) => Padding(
                      padding: EdgeInsetsDirectional.only(bottom: 12.h),
                      child: DsCard(
                        onTap: () => context.pushNamed(
                          AppRoutes.claimDetail,
                          extra: ClaimDetailArgs(claimId: claim.id),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
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
                                        claim.id,
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
                            SizedBox(height: 8.h),
                            Text(
                              claim.amount,
                              style: AppTextStyles.bodySmall.copyWith(
                                fontWeight: AppFontWeight.medium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: DsBottomNav(
        active: DsBottomNavTab.claims,
        onChanged: (tab) => _onTabChanged(context, tab),
      ),
    );
  }
}
