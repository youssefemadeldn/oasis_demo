import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_font_weight.dart';
import '../theme/app_text_styles.dart';

/// Oasis Design System top bar. Built from
/// `doc/design/Oasis Design System/components/navigation/TopBar.jsx`.
class DsTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final Widget? trailing;

  const DsTopBar({super.key, required this.title, this.onBack, this.trailing});

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
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
