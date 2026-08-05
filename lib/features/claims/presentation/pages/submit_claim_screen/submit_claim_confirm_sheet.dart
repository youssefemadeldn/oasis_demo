import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_font_weight.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/ds_button.dart';

/// Content passed into `BottomSheetHelper.showAppBottomSheet` for the
/// "Submit claim?" confirmation.
class SubmitClaimConfirmSheet extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const SubmitClaimConfirmSheet({
    super.key,
    required this.onCancel,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w, vertical: 8.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'submitClaim.confirmTitle'.tr(),
            style: AppTextStyles.titleLarge.copyWith(
              fontWeight: AppFontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'submitClaim.confirmBody'.tr(),
            style: AppTextStyles.bodyMedium,
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: DsButton(
                  label: 'common.cancel'.tr(),
                  variant: DsButtonVariant.secondary,
                  full: true,
                  onPressed: onCancel,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: DsButton(
                  label: 'common.confirm'.tr(),
                  full: true,
                  onPressed: onConfirm,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
