import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Constructor-injected with `GlobalKey<NavigatorState>` — call sites use
/// `getIt<DialogHelper>().showAppDialog(...)`, never a static method.
@lazySingleton
class DialogHelper {
  final GlobalKey<NavigatorState> _navigatorKey;

  DialogHelper(this._navigatorKey);

  BuildContext? get _context => _navigatorKey.currentContext;

  Future<void> showAppDialog({
    required String title,
    required String message,
    String confirmLabel = 'OK',
    VoidCallback? onConfirm,
  }) {
    final context = _context;
    if (context == null) return Future.value();

    return showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(title, style: AppTextStyles.titleLarge),
        content: Text(message, style: AppTextStyles.bodyMedium),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              onConfirm?.call();
            },
            child: Text(confirmLabel),
          ),
        ],
      ),
    );
  }

  Future<void> showConfirmDialog({
    required String title,
    required String message,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    final context = _context;
    if (context == null) return Future.value();

    return showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(title, style: AppTextStyles.titleLarge),
        content: Text(message, style: AppTextStyles.bodyMedium),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              onCancel?.call();
            },
            child: Text(cancelLabel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              onConfirm?.call();
            },
            child: Text(confirmLabel),
          ),
        ],
      ),
    );
  }

  Future<void> showLoadingDialog() {
    final context = _context;
    if (context == null) return Future.value();

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(24.r),
            child: CircularProgressIndicator(color: AppColors.primary),
          ),
        ),
      ),
    );
  }

  void hideDialog() {
    final context = _context;
    if (context == null) return;
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}
