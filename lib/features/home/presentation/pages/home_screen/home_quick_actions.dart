import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/router/app_routes.dart';
import '../../../../../core/widgets/ds_button.dart';

/// "Submit a Claim" / "View Policies" quick-action buttons.
class HomeQuickActions extends StatelessWidget {
  const HomeQuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DsButton(
            label: 'home.submitClaim'.tr(),
            size: DsButtonSize.sm,
            full: true,
            onPressed: () => context.pushNamed(AppRoutes.submitClaim),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: DsButton(
            label: 'home.viewPolicies'.tr(),
            size: DsButtonSize.sm,
            variant: DsButtonVariant.secondary,
            full: true,
            onPressed: () => context.goNamed(AppRoutes.policies),
          ),
        ),
      ],
    );
  }
}
