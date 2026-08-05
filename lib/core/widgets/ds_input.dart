import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_font_weight.dart';
import '../theme/app_text_styles.dart';

/// Oasis Design System text field — label permanently above the field
/// (not a floating `InputDecoration.labelText`). Built from
/// `doc/design/Oasis Design System/components/forms/Input.jsx`.
class DsInput extends StatefulWidget {
  final String label;
  final String? hint;
  final bool obscureText;
  final String? errorText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;

  const DsInput({
    super.key,
    required this.label,
    this.hint,
    this.obscureText = false,
    this.errorText,
    this.controller,
    this.onChanged,
    this.prefixIcon,
    this.keyboardType,
  });

  @override
  State<DsInput> createState() => _DsInputState();
}

class _DsInputState extends State<DsInput> {
  final _focusNode = FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() => _focused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Color get _borderColor {
    if (widget.errorText != null) return AppColors.statusRejectedFg;
    if (_focused) return AppColors.primary;
    return AppColors.divider;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style:
              AppTextStyles.bodySmall.copyWith(fontWeight: AppFontWeight.medium),
        ),
        SizedBox(height: 6.h),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: _borderColor,
              width: widget.errorText != null || _focused ? 1.5 : 1,
            ),
            boxShadow: _focused
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.15),
                      blurRadius: 0,
                      spreadRadius: 3.r,
                    ),
                  ]
                : null,
          ),
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 14.w,
            vertical: 2.h,
          ),
          child: Row(
            children: [
              if (widget.prefixIcon != null) ...[
                widget.prefixIcon!,
                SizedBox(width: 8.w),
              ],
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  obscureText: widget.obscureText,
                  onChanged: widget.onChanged,
                  keyboardType: widget.keyboardType,
                  style: AppTextStyles.bodyMedium,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                    hintText: widget.hint,
                    hintStyle:
                        AppTextStyles.bodyMedium.copyWith(color: AppColors.textHint),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (widget.errorText != null) ...[
          SizedBox(height: 4.h),
          Text(
            widget.errorText!,
            style: AppTextStyles.labelLarge.copyWith(
              color: AppColors.statusRejectedFg,
            ),
          ),
        ],
      ],
    );
  }
}
