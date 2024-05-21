import 'package:flutter/material.dart';

class SysNotificationResponse {
  List<SysNotificationModel>? sysnotificationList;

  SysNotificationResponse({this.sysnotificationList});
}

class SysNotificationModel {
  final String title;
  final String date;
  final String time;
  final String message;
  final Color containerColor;
  final IconData icon;

  SysNotificationModel({
    required this.title,
    required this.date,
    required this.time,
    required this.message,
    required this.containerColor,
    required this.icon,
  });
}

List<SysNotificationModel> getSysNotificationModelList() {
  List<SysNotificationModel> sysnotificationList = [];
  sysnotificationList.add(
    SysNotificationModel(
      title: 'Security Updates!',
      date: 'Today',
      time: '09:24 AM',
      message: 'Now Scribblr has two-factor authorization, Try it now to make your account more secure.',
      containerColor: Colors.green,
      icon: Icons.security,
    ),
  );
  sysnotificationList.add(
    SysNotificationModel(
      title: 'Bookmark Feature Available!',
      date: '1 Day ago',
      time: '09:24 AM',
      message: 'Now you can add your favorite article to bookmarks. You can access it through the home page -> my bookmark.',
      containerColor: Colors.blue,
      icon: Icons.bookmark,
    ),
  );

  return sysnotificationList;
}
