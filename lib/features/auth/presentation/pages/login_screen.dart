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
import '../../../../core/widgets/ds_input.dart';
import '../../../../core/widgets/ds_toast.dart';

/// Login screen — national ID + password, purely local UI state (no auth
/// wiring yet). "Login" navigates straight to Home.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _nationalIdController;
  late final TextEditingController _passwordController;
  bool _showForgotMessage = false;

  @override
  void initState() {
    super.initState();
    _nationalIdController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nationalIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _toggleForgotPassword() {
    setState(() => _showForgotMessage = !_showForgotMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceDark,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 28.w,
                            vertical: 40.h,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppConstants.kLogoFull, height: 40.h),
                              SizedBox(height: 18.h),
                              Text(
                                'auth.login.tagline'.tr(),
                                textAlign: TextAlign.center,
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.textOnDarkMuted,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsetsDirectional.fromSTEB(24.w, 28.h, 24.w, 32.h),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24.r),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'auth.login.welcomeBack'.tr(),
                              style: AppTextStyles.headlineSmall.copyWith(
                                fontWeight: AppFontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 14.h),
                            DsInput(
                              label: 'auth.login.nationalIdLabel'.tr(),
                              hint: 'auth.login.nationalIdHint'.tr(),
                              controller: _nationalIdController,
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 14.h),
                            DsInput(
                              label: 'auth.login.passwordLabel'.tr(),
                              hint: 'auth.login.passwordHint'.tr(),
                              controller: _passwordController,
                              obscureText: true,
                            ),
                            SizedBox(height: 8.h),
                            Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: GestureDetector(
                                onTap: _toggleForgotPassword,
                                child: Text(
                                  'auth.login.forgotPassword'.tr(),
                                  style: AppTextStyles.labelLarge.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                            if (_showForgotMessage) ...[
                              SizedBox(height: 8.h),
                              DsToast(message: 'auth.login.forgotPasswordSent'.tr()),
                            ],
                            SizedBox(height: 14.h),
                            DsButton(
                              label: 'auth.login.loginButton'.tr(),
                              full: true,
                              onPressed: () => context.goNamed(AppRoutes.home),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
