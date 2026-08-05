import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_font_weight.dart';
import '../theme/app_text_styles.dart';

/// Oasis Design System select. Built from
/// `doc/design/Oasis Design System/components/forms/Select.jsx`.
class DsSelect extends StatelessWidget {
  final String label;
  final List<String> options;
  final String? value;
  final ValueChanged<String?> onChanged;

  const DsSelect({
    super.key,
    required this.label,
    required this.options,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:
              AppTextStyles.bodySmall.copyWith(fontWeight: AppFontWeight.medium),
        ),
        SizedBox(height: 6.h),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.divider),
          ),
          padding: EdgeInsetsDirectional.symmetric(horizontal: 14.w),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              icon: Icon(Icons.expand_more_rounded,
                  color: AppColors.textHint, size: 20.w),
              style: AppTextStyles.bodyMedium,
              hint: Text('—', style: AppTextStyles.bodyMedium),
              items: options
                  .map(
                    (o) => DropdownMenuItem<String>(
                      value: o,
                      child: Text(o, style: AppTextStyles.bodyMedium),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
