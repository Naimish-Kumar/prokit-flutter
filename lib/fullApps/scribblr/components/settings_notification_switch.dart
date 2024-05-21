import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../main.dart';
import '../components/text_styles.dart';

import '../utils/colors.dart';

class NotificationSwitch extends StatefulWidget {
  final String title;

  NotificationSwitch(this.title);

  @override
  _NotificationSwitchState createState() => _NotificationSwitchState();
}

class _NotificationSwitchState extends State<NotificationSwitch> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style: TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
        ).expand(),
        Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });
          },
          activeTrackColor: scribblrPrimaryColor,
          inactiveTrackColor: context.scaffoldBackgroundColor,
          activeColor: Colors.white,
        )
      ],
    );
  }
}

//Notification Screen
List<String> titles = [
  'Notify me when...',
  'There is a new Recommendations',
  'Someone is Following Me',
  'There are comments on my Article',
  'Someone Tagged me in a comment',
  'Someone Liked my Comment',
  'There is Activity on my Account',
  'Divider',
  'System',
  'App System',
  'Guidance & Tips',
  'Participate in a Survey'
];

List<Widget> notificationSwitch = titles.map((title) {
  if (title == 'Divider') {
    return Divider(color: dividerDarkColor,
      thickness: appStore.isDarkModeOn ? 0.3 :0.2,
    );
  } else if (title == 'Notify me when...' || title == 'System') {
    return Text(title, style: notifiTitleTextStyle());
  } else {
    return NotificationSwitch(title);
  }
}).toList();

//Security Screen
List<String> securityTitles = [
  'Remember Me',
  'Biometric ID',
  'Face ID',
  'SMS Authenticator',
  'Google Authenticator'
];

List<Widget> securityScreen = securityTitles.map((title) => NotificationSwitch(title)).toList();
