import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/gen_notification_res_model.dart';
import 'text_styles.dart';

class GenNotificationComponent extends StatelessWidget {
  final GenNotificationModel genNotificationData;

  GenNotificationComponent({required this.genNotificationData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration:
          boxDecorationDefault(color: context.scaffoldBackgroundColor, boxShadow: List.empty()),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage(genNotificationData.authorImage), fit: BoxFit.cover),
          ),
        ),
        16.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(genNotificationData.authorName + genNotificationData.notificationText,
                style: gentextStyle(), maxLines: 2, overflow: TextOverflow.ellipsis),
            5.height,
            Row(
              children: [
                Text(genNotificationData.date, style: secondarytextStyle()),
                5.width,
                Text(genNotificationData.time, style: secondarytextStyle()),
              ],
            ),
          ],
        ).expand(),
        16.width,
        Image.asset(
          genNotificationData.contentImage,
          fit: BoxFit.cover,
          width: 60,
          height: 60,
        ).cornerRadiusWithClipRRect(10),
      ]),
    );
  }
}
