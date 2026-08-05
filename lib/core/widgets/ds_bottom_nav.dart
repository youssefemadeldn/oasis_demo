import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_font_weight.dart';
import '../theme/app_text_styles.dart';
import 'icons/ds_icons.dart';

/// Tab identity — mirrors `BottomNav.jsx`'s four items.
enum DsBottomNavTab { home, policies, claims, profile }

class _TabDef {
  final DsBottomNavTab tab;
  final String labelKey;
  final Widget Function(bool active) icon;
  const _TabDef(this.tab, this.labelKey, this.icon);
}

final List<_TabDef> _kTabs = [
  _TabDef(DsBottomNavTab.home, 'common.nav.home',
      (active) => DsIcon.home(active: active)),
  _TabDef(DsBottomNavTab.policies, 'common.nav.policies',
      (active) => DsIcon.document(active: active)),
  _TabDef(DsBottomNavTab.claims, 'common.nav.claims',
      (active) => DsIcon.claim(active: active)),
  _TabDef(DsBottomNavTab.profile, 'common.nav.profile',
      (active) => DsIcon.profile(active: active)),
];

/// Oasis Design System bottom navigation. Built from
/// `doc/design/Oasis Design System/components/navigation/BottomNav.jsx`.
class DsBottomNav extends StatelessWidget {
  final DsBottomNavTab active;
  final ValueChanged<DsBottomNavTab> onChanged;

  const DsBottomNav({super.key, required this.active, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border(top: BorderSide(color: AppColors.divider)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _kTabs.map((def) {
            final isActive = def.tab == active;
            final color =
                isActive ? AppColors.primary : AppColors.textHint;
            return InkWell(
              onTap: () => onChanged(def.tab),
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w, vertical: 2.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    def.icon(isActive),
                    SizedBox(height: 3.h),
                    Text(
                      def.labelKey.tr(),
                      style: AppTextStyles.labelSmall.copyWith(
                        color: color,
                        fontWeight:
                            isActive ? AppFontWeight.semiBold : AppFontWeight.medium,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
