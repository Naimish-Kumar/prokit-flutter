import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../components/common_app_divider.dart';
import '../model/notification_model.dart';
import 'notification_widget.dart';

class AllNotificationList extends StatefulWidget {
  @override
  State<AllNotificationList> createState() => _AllNotificationListState();
}

class _AllNotificationListState extends State<AllNotificationList> {
  List<NotificationModel> newNotificationData = getNewNotificationList();
  List<NotificationModel> earlierNotificationData = getEarlierNotificationList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('New', style: boldTextStyle(size: 18, color: whiteColor)),
        16.height,
        ListView.separated(
          itemCount: newNotificationData.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => CommonAppDividerWidget(height: 30),
          itemBuilder: (ctx, index) {
            NotificationModel data = newNotificationData[index];
            return AnimatedItemWidget(child: NotificationWidget(modObj: data));
          },
        ),
        CommonAppDividerWidget(height: 30),
        Text('Earlier', style: boldTextStyle(size: 18, color: whiteColor)),
        16.height,
        ListView.separated(
          itemCount: earlierNotificationData.length,
          separatorBuilder: (context, index) => CommonAppDividerWidget(height: 30),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            NotificationModel data = earlierNotificationData[index];
            return AnimatedItemWidget(child: NotificationWidget(modObj: data));
          },
        ),
      ],
    );
  }
}
