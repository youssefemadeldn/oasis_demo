import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_constants.dart';
import '../theme/app_colors.dart';

/// Oasis Design System switch — a custom 42×24 pill, not the Material
/// `Switch`, to match `doc/design/Oasis Design System/components/forms/Switch.jsx`
/// exactly.
class DsSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const DsSwitch({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: AppConstants.kAnimationDuration,
        width: 42.w,
        height: 24.h,
        padding: EdgeInsets.all(3.r),
        decoration: BoxDecoration(
          color: value ? AppColors.primary : AppColors.divider,
          borderRadius: BorderRadius.circular(999.r),
        ),
        child: AnimatedAlign(
          duration: AppConstants.kAnimationDuration,
          alignment:
              value ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
          child: Container(
            width: 18.w,
            height: 18.w,
            decoration: const BoxDecoration(
              color: AppColors.surface,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
