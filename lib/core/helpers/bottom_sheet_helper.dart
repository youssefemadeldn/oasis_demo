import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

/// Static utility — takes [BuildContext] at the call site, no DI
/// registration (unlike [DialogHelper]).
class BottomSheetHelper {
  const BottomSheetHelper._();

  static Future<T?> showAppBottomSheet<T>(
    BuildContext context, {
    required Widget child,
    bool isScrollable = false,
    double? maxHeight,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollable,
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22.r)),
      ),
      builder: (context) => ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.9,
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _DragHandle(),
                Flexible(child: child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DragHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 4.h,
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColors.divider,
        borderRadius: BorderRadius.circular(999.r),
      ),
    );
  }
}
