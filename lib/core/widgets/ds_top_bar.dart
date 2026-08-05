import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_font_weight.dart';
import '../theme/app_text_styles.dart';

/// Oasis Design System top bar. Built from
/// `doc/design/Oasis Design System/components/navigation/TopBar.jsx`.
///
/// Placed as the first child of the screen's `SafeArea`-wrapped body
/// `Column` (never as `Scaffold.appBar`) — a plain `Container` used as
/// `Scaffold.appBar` does not get Flutter's automatic status-bar/notch
/// inset the way a real `AppBar` does, which previously left the title and
/// back button crushed under the status bar on every screen using it.
class DsTopBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;
  final Widget? trailing;

  const DsTopBar({super.key, required this.title, this.onBack, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.divider)),
      ),
      child: Row(
        children: [
          if (onBack != null)
            IconButton(
              onPressed: onBack,
              padding: EdgeInsets.zero,
              icon: Icon(Icons.arrow_back_rounded,
                  color: AppColors.textPrimary, size: 20.w),
            )
          else
            SizedBox(width: 4.w),
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.titleLarge
                  .copyWith(fontWeight: AppFontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }
}
