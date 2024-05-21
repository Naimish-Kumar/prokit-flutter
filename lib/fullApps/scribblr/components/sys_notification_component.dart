import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../main.dart';
import '../components/text_styles.dart';

import '../models/sys_notification_res_model.dart';

class SysNotificationComponent extends StatelessWidget {
  final SysNotificationModel sysNotificationData;

  SysNotificationComponent({required this.sysNotificationData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: boxDecorationDefault(color: context.scaffoldBackgroundColor, boxShadow: List.empty()),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(color: sysNotificationData.containerColor, shape: BoxShape.circle),
                child: Icon(sysNotificationData.icon),
              ),
              16.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sysNotificationData.title,
                    style: notifiTitleTextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
                  ),
                  5.height,
                  Row(
                    children: [
                      Text(sysNotificationData.date, style: secondarytextStyle()),
                      5.width,
                      Text(sysNotificationData.time, style: secondarytextStyle()),
                    ],
                  ),
                ],
              ).expand(),
            ],
          ),
        ),
        Text(
          sysNotificationData.message,
          style: TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
        ).paddingSymmetric(horizontal: 16),
      ],
    );
  }
}
