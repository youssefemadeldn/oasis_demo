import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font_weight.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/ds_bottom_nav.dart';
import '../../../../core/widgets/ds_button.dart';
import '../../../../core/widgets/ds_card.dart';
import '../../../../core/widgets/ds_switch.dart';
import '../../../../core/widgets/ds_top_bar.dart';

const String _kPolicyholderName = 'Omarn Ibrahim';
const String _kPolicyholderInitials = 'OI';
const String _kMaskedNationalId = '•••• 4821';
const String _kPhone = '+966 55 123 4567';
const String _kEmail = 'omarn.ibrahim@email.com';

/// Profile — routing target for [AppRoutes.profile].
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notificationsOn = true;

  void _onTabChanged(BuildContext context, DsBottomNavTab tab) {
    switch (tab) {
      case DsBottomNavTab.home:
        context.goNamed(AppRoutes.home);
      case DsBottomNavTab.policies:
        context.goNamed(AppRoutes.policies);
      case DsBottomNavTab.claims:
        context.goNamed(AppRoutes.claims);
      case DsBottomNavTab.profile:
        return;
    }
  }

  void _toggleArabic(bool value) {
    context.setLocale(Locale(value ? 'ar' : 'en'));
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DsTopBar(title: 'profile.title'.tr()),
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
                            children: [
                              Container(
                                width: 48.w,
                                height: 48.w,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  _kPolicyholderInitials,
                                  style: AppTextStyles.titleLarge.copyWith(
                                    color: AppColors.surface,
                                    fontWeight: AppFontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _kPolicyholderName,
                                      style: AppTextStyles.titleMedium.copyWith(
                                        fontWeight: AppFontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      'profile.nationalId'.tr(args: [_kMaskedNationalId]),
                                      style: AppTextStyles.bodySmall.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 14.h),
                          Divider(color: AppColors.divider),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('profile.phone'.tr(), style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textSecondary,
                              )),
                              Text(_kPhone, style: AppTextStyles.bodySmall),
                            ],
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('profile.email'.tr(), style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textSecondary,
                              )),
                              Text(_kEmail, style: AppTextStyles.bodySmall),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 14.h),
                    DsCard(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('profile.arabicInterface'.tr(), style: AppTextStyles.bodyMedium),
                              DsSwitch(value: isArabic, onChanged: _toggleArabic),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('profile.pushNotifications'.tr(), style: AppTextStyles.bodyMedium),
                              DsSwitch(
                                value: _notificationsOn,
                                onChanged: (v) => setState(() => _notificationsOn = v),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 14.h),
                    DsCard(
                      onTap: () => context.pushNamed(AppRoutes.support),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('profile.contactBroker'.tr(), style: AppTextStyles.bodyMedium),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.textHint,
                            size: 18.w,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 18.h),
                    DsButton(
                      label: 'profile.signOut'.tr(),
                      variant: DsButtonVariant.secondary,
                      full: true,
                      onPressed: () => context.goNamed(AppRoutes.login),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: DsBottomNav(
        active: DsBottomNavTab.profile,
        onChanged: (tab) => _onTabChanged(context, tab),
      ),
    );
  }
}
