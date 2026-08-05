import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_weight.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/icons/ds_icons.dart';

/// Step 3 — mock photo/document attachments (no real image picker — not an
/// approved new dependency for this UI-only pass).
class SubmitClaimStep3Documents extends StatelessWidget {
  final List<String> photoNames;
  final VoidCallback onAddPhoto;
  final ValueChanged<String> onRemovePhoto;

  const SubmitClaimStep3Documents({
    super.key,
    required this.photoNames,
    required this.onAddPhoto,
    required this.onRemovePhoto,
  });

  Widget _addButton(String labelKey, Widget icon) {
    return Expanded(
      child: InkWell(
        onTap: onAddPhoto,
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.divider,
              width: 1.5,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            children: [
              icon,
              SizedBox(height: 6.h),
              Text(
                labelKey.tr(),
                style: AppTextStyles.labelLarge.copyWith(
                  color: AppColors.primary,
                  fontWeight: AppFontWeight.medium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'submitClaim.addDocuments'.tr(),
          style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            _addButton('submitClaim.takePhoto', DsIcon.camera()),
            SizedBox(width: 10.w),
            _addButton('submitClaim.gallery', DsIcon.gallery()),
          ],
        ),
        if (photoNames.isNotEmpty) ...[
          SizedBox(height: 10.h),
          Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: photoNames.map((name) {
              return Container(
                width: 76.w,
                height: 76.w,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  border: Border.all(color: AppColors.divider),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DsIcon.gallery(color: AppColors.textHint),
                          SizedBox(height: 4.h),
                          Text(name, style: AppTextStyles.labelSmall),
                        ],
                      ),
                    ),
                    PositionedDirectional(
                      top: -6.h,
                      end: -6.w,
                      child: GestureDetector(
                        onTap: () => onRemovePhoto(name),
                        child: Container(
                          width: 20.w,
                          height: 20.w,
                          decoration: const BoxDecoration(
                            color: AppColors.surfaceDark,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close_rounded,
                            color: AppColors.surface,
                            size: 12.w,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}
