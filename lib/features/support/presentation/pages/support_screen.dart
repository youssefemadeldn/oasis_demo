import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font_weight.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/ds_button.dart';
import '../../../../core/widgets/ds_card.dart';
import '../../../../core/widgets/ds_top_bar.dart';

const String _kBrokerName = 'Fahad Al-Zahrani';
const String _kPhone = '+966 12 653 4000';
const String _kPhoneUri = 'tel:+966126534000';
const String _kWebsite = 'www.oasis.com.sa';
const String _kEmail = 'support@oasis.com.sa';
const String _kEmailUri = 'mailto:support@oasis.com.sa';

class _Faq {
  final String questionKey;
  final String answerKey;
  bool open = false;

  _Faq({required this.questionKey, required this.answerKey});
}

/// Support — FAQ + broker contact, pushed from Profile.
class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final List<_Faq> _faqs = [
    _Faq(questionKey: 'support.faq1.q', answerKey: 'support.faq1.a'),
    _Faq(questionKey: 'support.faq2.q', answerKey: 'support.faq2.a'),
    _Faq(questionKey: 'support.faq3.q', answerKey: 'support.faq3.a'),
  ];

  Future<void> _launch(String uri) => launchUrl(Uri.parse(uri));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DsTopBar(
              title: 'support.title'.tr(),
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
                          Text(
                            _kBrokerName,
                            style: AppTextStyles.titleMedium.copyWith(
                              fontWeight: AppFontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            'support.brokerRole'.tr(),
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          SizedBox(height: 14.h),
                          Row(
                            children: [
                              Icon(Icons.call_outlined,
                                  color: AppColors.primary, size: 16.w),
                              SizedBox(width: 10.w),
                              Text(_kPhone, style: AppTextStyles.bodySmall),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Icon(Icons.public_rounded,
                                  color: AppColors.primary, size: 16.w),
                              SizedBox(width: 10.w),
                              Text(_kWebsite, style: AppTextStyles.bodySmall),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Icon(Icons.mail_outline_rounded,
                                  color: AppColors.primary, size: 16.w),
                              SizedBox(width: 10.w),
                              Text(_kEmail, style: AppTextStyles.bodySmall),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            children: [
                              Expanded(
                                child: DsButton(
                                  label: 'common.call'.tr(),
                                  full: true,
                                  onPressed: () => _launch(_kPhoneUri),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: DsButton(
                                  label: 'common.message'.tr(),
                                  variant: DsButtonVariant.secondary,
                                  full: true,
                                  onPressed: () => _launch(_kEmailUri),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Text(
                      'support.faqTitle'.tr(),
                      style: AppTextStyles.bodySmall.copyWith(
                        fontWeight: AppFontWeight.semiBold,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    ...List.generate(_faqs.length, (i) {
                      final faq = _faqs[i];
                      return Padding(
                        padding: EdgeInsetsDirectional.only(bottom: 10.h),
                        child: DsCard(
                          padded: false,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () => setState(() => faq.open = !faq.open),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.symmetric(
                                    horizontal: 16.w,
                                    vertical: 14.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          faq.questionKey.tr(),
                                          style: AppTextStyles.bodySmall.copyWith(
                                            fontWeight: AppFontWeight.medium,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        faq.open
                                            ? Icons.expand_less_rounded
                                            : Icons.chevron_right_rounded,
                                        color: AppColors.textHint,
                                        size: 16.w,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (faq.open)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    16.w,
                                    0,
                                    16.w,
                                    16.h,
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Text(
                                      faq.answerKey.tr(),
                                      style: AppTextStyles.bodySmall.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    }),
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
