import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/router/app_routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/ds_bottom_nav.dart';
import 'home_header.dart';
import 'home_quick_actions.dart';
import 'home_recent_activity.dart';
import 'home_stats_row.dart';

/// Dashboard — routing target for [AppRoutes.home].
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onTabChanged(BuildContext context, DsBottomNavTab tab) {
    switch (tab) {
      case DsBottomNavTab.home:
        return;
      case DsBottomNavTab.policies:
        context.goNamed(AppRoutes.policies);
      case DsBottomNavTab.claims:
        context.goNamed(AppRoutes.claims);
      case DsBottomNavTab.profile:
        context.goNamed(AppRoutes.profile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeStatsRow(),
                    SizedBox(height: 14.h),
                    const HomeQuickActions(),
                    SizedBox(height: 18.h),
                    const HomeRecentActivity(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: DsBottomNav(
        active: DsBottomNavTab.home,
        onChanged: (tab) => _onTabChanged(context, tab),
      ),
    );
  }
}
