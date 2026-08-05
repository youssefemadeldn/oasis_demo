import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_font_weight.dart';
import '../theme/app_text_styles.dart';

/// Visual variant — mirrors `Button.jsx`'s `variant` prop.
enum DsButtonVariant { primary, secondary, ghost, danger, dark }

/// Size — mirrors `Button.jsx`'s `size` prop.
enum DsButtonSize { sm, md, lg }

/// Oasis Design System button. Built from
/// `doc/design/Oasis Design System/components/core/Button.jsx`.
class DsButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final DsButtonVariant variant;
  final DsButtonSize size;
  final Widget? icon;
  final bool full;

  const DsButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = DsButtonVariant.primary,
    this.size = DsButtonSize.md,
    this.icon,
    this.full = false,
  });

  bool get _disabled => onPressed == null;

  EdgeInsetsGeometry get _padding => switch (size) {
        DsButtonSize.sm =>
          EdgeInsetsDirectional.symmetric(horizontal: 14.w, vertical: 8.h),
        DsButtonSize.md =>
          EdgeInsetsDirectional.symmetric(horizontal: 18.w, vertical: 11.h),
        DsButtonSize.lg =>
          EdgeInsetsDirectional.symmetric(horizontal: 22.w, vertical: 14.h),
      };

  TextStyle get _textStyle {
    final base = switch (size) {
      DsButtonSize.sm => AppTextStyles.bodySmall,
      DsButtonSize.md => AppTextStyles.bodyLarge,
      DsButtonSize.lg => AppTextStyles.bodyLarge,
    };
    return base.copyWith(
      fontWeight: AppFontWeight.semiBold,
      color: _foreground,
    );
  }

  Color get _background => switch (variant) {
        DsButtonVariant.primary => AppColors.primary,
        DsButtonVariant.secondary => AppColors.surface,
        DsButtonVariant.ghost => Colors.transparent,
        DsButtonVariant.danger => AppColors.statusRejectedFg,
        DsButtonVariant.dark => const Color(0xFF0A1420), // --navy-900
      };

  Color get _foreground => switch (variant) {
        DsButtonVariant.primary => AppColors.surface,
        DsButtonVariant.secondary => AppColors.primaryDark,
        DsButtonVariant.ghost => AppColors.primaryDark,
        DsButtonVariant.danger => AppColors.surface,
        DsButtonVariant.dark => AppColors.surface,
      };

  BoxBorder? get _border => variant == DsButtonVariant.secondary
      ? Border.all(color: AppColors.divider)
      : null;

  @override
  Widget build(BuildContext context) {
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[icon!, SizedBox(width: 8.w)],
        Text(label, style: _textStyle),
      ],
    );

    return Opacity(
      opacity: _disabled ? 0.45 : 1,
      child: Material(
        color: _background,
        borderRadius: BorderRadius.circular(10.r),
        child: InkWell(
          onTap: _disabled ? null : onPressed,
          borderRadius: BorderRadius.circular(10.r),
          child: Container(
            width: full ? double.infinity : null,
            padding: _padding,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: _border,
              boxShadow: variant == DsButtonVariant.primary && !_disabled
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.28),
                        blurRadius: 24.r,
                        offset: Offset(0, 8.h),
                      ),
                    ]
                  : null,
            ),
            child: content,
          ),
        ),
      ),
    );
  }
}
