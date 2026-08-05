import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

/// Oasis Design System card. Built from
/// `doc/design/Oasis Design System/components/core/Card.jsx`.
class DsCard extends StatelessWidget {
  final Widget child;
  final bool padded;
  final VoidCallback? onTap;

  const DsCard({
    super.key,
    required this.child,
    this.padded = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.cardBackground,
      borderRadius: BorderRadius.circular(16.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: padded ? EdgeInsets.all(16.r) : EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.divider),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF0F1E2E).withValues(alpha: 0.06),
                blurRadius: 2.r,
                offset: Offset(0, 1.h),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
