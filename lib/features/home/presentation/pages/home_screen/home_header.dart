import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/router/app_routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_weight.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/icons/ds_icons.dart';
import 'home_mock_data.dart';

/// Dark greeting bar with the notification bell (unread badge). Tapping the
/// bell pushes [AppRoutes.notifications].
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.fromSTEB(20.w, 18.h, 20.w, 20.h),
      color: AppColors.surfaceDark,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'home.greeting'.tr(),
                style: AppTextStyles.labelLarge.copyWith(
                  color: AppColors.textOnDarkMuted,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                kHomePolicyholderName,
                style: AppTextStyles.titleMedium.copyWith(
                  color: AppColors.surface,
                  fontWeight: AppFontWeight.bold,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => context.pushNamed(AppRoutes.notifications),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                DsIcon.bell(),
                if (kHomeHasUnreadNotifications)
                  PositionedDirectional(
                    top: -2.h,
                    end: -2.w,
                    child: Container(
                      width: 9.w,
                      height: 9.w,
                      decoration: BoxDecoration(
                        color: AppColors.statusRejectedFg,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.surfaceDark,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
