import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/ds_top_bar.dart';

class _NotificationItem {
  final int id;
  final String textKey;
  final String timeKey;
  bool unread;

  _NotificationItem({
    required this.id,
    required this.textKey,
    required this.timeKey,
    required this.unread,
  });
}

/// Notifications inbox, pushed from Home's bell icon.
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<_NotificationItem> _notifications = [
    _NotificationItem(
      id: 1,
      textKey: 'notifications.item1',
      timeKey: 'notifications.time1',
      unread: true,
    ),
    _NotificationItem(
      id: 2,
      textKey: 'notifications.item2',
      timeKey: 'notifications.time2',
      unread: true,
    ),
    _NotificationItem(
      id: 3,
      textKey: 'notifications.item3',
      timeKey: 'notifications.time3',
      unread: false,
    ),
    _NotificationItem(
      id: 4,
      textKey: 'notifications.item4',
      timeKey: 'notifications.time4',
      unread: false,
    ),
    _NotificationItem(
      id: 5,
      textKey: 'notifications.item5',
      timeKey: 'notifications.time5',
      unread: false,
    ),
  ];

  void _markRead(_NotificationItem n) {
    if (!n.unread) return;
    setState(() => n.unread = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DsTopBar(
        title: 'notifications.title'.tr(),
        onBack: () => context.pop(),
      ),
      body: SafeArea(
        top: false,
        child: ListView.separated(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 8.h),
          itemCount: _notifications.length,
          separatorBuilder: (_, _) => Divider(color: AppColors.divider, height: 1),
          itemBuilder: (context, index) {
            final n = _notifications[index];
            return InkWell(
              onTap: () => _markRead(n),
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(vertical: 14.h, horizontal: 4.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 16.w,
                      child: n.unread
                          ? Padding(
                              padding: EdgeInsetsDirectional.only(top: 6.h),
                              child: Container(
                                width: 8.w,
                                height: 8.w,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                          : null,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(n.textKey.tr(), style: AppTextStyles.bodySmall),
                          SizedBox(height: 4.h),
                          Text(
                            n.timeKey.tr(),
                            style: AppTextStyles.labelSmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
