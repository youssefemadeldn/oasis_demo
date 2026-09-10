import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Constructor-injected with `GlobalKey<NavigatorState>` — call sites use
/// `getIt<SnackBarHelper>().showSuccess(...)`, never a static method.
@lazySingleton
class SnackBarHelper {
  final GlobalKey<NavigatorState> _navigatorKey;

  SnackBarHelper(this._navigatorKey);

  void showSuccess(String message) =>
      _show(message, backgroundColor: AppColors.success, icon: Icons.check_circle);

  void showError(String message) =>
      _show(message, backgroundColor: AppColors.error, icon: Icons.error);

  void showInfo(String message) =>
      _show(message, backgroundColor: AppColors.primary, icon: Icons.info);

  void showWarning(String message) =>
      _show(message, backgroundColor: AppColors.warning, icon: Icons.warning);

  void _show(
    String message, {
    required Color backgroundColor,
    required IconData icon,
  }) {
    final context = _navigatorKey.currentContext;
    if (context == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        content: Row(
          children: [
            Icon(icon, color: AppColors.surface, size: 20.w),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                message,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.surface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
