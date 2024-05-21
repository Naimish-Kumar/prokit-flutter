import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../utils/colors.dart';

class ContactusWidget extends StatelessWidget {
  final IconData? icon;
  final String text;

  ContactusWidget({this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: borderColor), borderRadius: BorderRadius.circular(16)),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          16.width,
          Icon(icon, color: scribblrPrimaryColor),
          16.width,
          Text(text, style: TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor)),
        ],
      ),
    ).paddingSymmetric(vertical: 16, horizontal: 16);
  }
}
