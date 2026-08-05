import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/router/args/policy_detail_args.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font_weight.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/ds_bottom_nav.dart';
import '../../../../core/widgets/ds_card.dart';
import '../../../../core/widgets/ds_tag.dart';
import '../../../../core/widgets/ds_top_bar.dart';
import '../../../../core/widgets/icons/ds_icons.dart';
import 'policies_mock_data.dart';

/// My Policies — routing target for [AppRoutes.policies].
class PoliciesScreen extends StatelessWidget {
  const PoliciesScreen({super.key});

  void _onTabChanged(BuildContext context, DsBottomNavTab tab) {
    switch (tab) {
      case DsBottomNavTab.home:
        context.goNamed(AppRoutes.home);
      case DsBottomNavTab.policies:
        return;
      case DsBottomNavTab.claims:
        context.goNamed(AppRoutes.claims);
      case DsBottomNavTab.profile:
        context.goNamed(AppRoutes.profile);
    }
  }

  Widget _typeIcon(PolicyType type) => switch (type) {
        PolicyType.motor => DsIcon.motor(),
        PolicyType.property => DsIcon.property(),
        PolicyType.medical => DsIcon.medical(),
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DsTopBar(title: 'policies.title'.tr()),
      body: SafeArea(
        top: false,
        child: ListView.separated(
          padding: EdgeInsets.all(16.r),
          itemCount: kPolicies.length,
          separatorBuilder: (_, _) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            final policy = kPolicies[index];
            return DsCard(
              onTap: () => context.pushNamed(
                AppRoutes.policyDetail,
                extra: PolicyDetailArgs(policyId: policy.id),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40.w,
                    height: 40.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.brandSoft,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: _typeIcon(policy.type),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          policy.line,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'policies.expires'.tr(args: [policy.expiry]),
                              style: AppTextStyles.labelLarge,
                            ),
                            DsTag(
                              label: policy.tagKey.tr(),
                              tone: policy.tagTone,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: DsBottomNav(
        active: DsBottomNavTab.policies,
        onChanged: (tab) => _onTabChanged(context, tab),
      ),
    );
  }
}
