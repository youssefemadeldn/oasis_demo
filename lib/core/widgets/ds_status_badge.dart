import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_font_weight.dart';
import '../theme/app_text_styles.dart';

/// Claim/policy status vocabulary — mirrors the desktop products' status
/// tokens and `StatusBadge.jsx`'s `MAP`.
enum ClaimStatus { pending, closed, rejected, processing, invoiced, cancelled }

class _StatusColors {
  final Color bg;
  final Color fg;
  const _StatusColors(this.bg, this.fg);
}

const Map<ClaimStatus, _StatusColors> _kStatusColors = {
  ClaimStatus.pending:
      _StatusColors(AppColors.statusPendingBg, AppColors.statusPendingFg),
  ClaimStatus.closed:
      _StatusColors(AppColors.statusClosedBg, AppColors.statusClosedFg),
  ClaimStatus.rejected:
      _StatusColors(AppColors.statusRejectedBg, AppColors.statusRejectedFg),
  ClaimStatus.processing:
      _StatusColors(AppColors.statusProcessingBg, AppColors.statusProcessingFg),
  ClaimStatus.invoiced:
      _StatusColors(AppColors.statusInvoicedBg, AppColors.statusInvoicedFg),
  ClaimStatus.cancelled:
      _StatusColors(AppColors.statusCancelledBg, AppColors.statusCancelledFg),
};

String _statusLabelKey(ClaimStatus status) => switch (status) {
      ClaimStatus.pending => 'common.status.pending',
      ClaimStatus.closed => 'common.status.closed',
      ClaimStatus.rejected => 'common.status.rejected',
      ClaimStatus.processing => 'common.status.processing',
      ClaimStatus.invoiced => 'common.status.invoiced',
      ClaimStatus.cancelled => 'common.status.cancelled',
    };

/// Oasis Design System status badge. Built from
/// `doc/design/Oasis Design System/components/core/StatusBadge.jsx`.
class DsStatusBadge extends StatelessWidget {
  final ClaimStatus status;

  const DsStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final colors = _kStatusColors[status]!;
    return Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: colors.bg,
        borderRadius: BorderRadius.circular(999.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6.w,
            height: 6.w,
            decoration: BoxDecoration(color: colors.fg, shape: BoxShape.circle),
          ),
          SizedBox(width: 6.w),
          Text(
            _statusLabelKey(status).tr(),
            style: AppTextStyles.labelLarge.copyWith(
              color: colors.fg,
              fontWeight: AppFontWeight.semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
