import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import 'home_header.dart';
import 'home_quick_actions.dart';
import 'home_recent_activity.dart';
import 'home_stats_row.dart';

/// Dashboard — routing target for the home tab.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
    );
  }
}
