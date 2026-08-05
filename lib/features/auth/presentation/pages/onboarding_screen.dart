import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font_weight.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/ds_button.dart';

/// "Get Started" pitch screen shown after [SplashScreen].
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceDark,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(28.w, 28.h, 28.w, 0),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Image.asset(AppConstants.kLogoFull, height: 26.h),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 32.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120.w,
                      height: 120.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.r),
                        gradient: LinearGradient(
                          begin: AlignmentDirectional.topStart,
                          end: AlignmentDirectional.bottomEnd,
                          colors: [AppColors.secondary, AppColors.primary],
                        ),
                      ),
                      child: Icon(
                        Icons.description_outlined,
                        color: AppColors.surface,
                        size: 56.w,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'onboarding.title'.tr(),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.headlineSmall.copyWith(
                        color: AppColors.surface,
                        fontWeight: AppFontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'onboarding.subtitle'.tr(),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textOnDarkMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.w, 0, 24.w, 32.h),
              child: DsButton(
                label: 'onboarding.getStarted'.tr(),
                full: true,
                onPressed: () => context.goNamed(AppRoutes.login),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
