import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../utils/colors.dart';
import '../utils/common.dart';
import 'text_styles.dart';

class FaqTileWidget extends StatelessWidget {
  final String title;
  final String childrenText;

  FaqTileWidget({required this.title, required this.childrenText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: borderColor), borderRadius: BorderRadius.circular(DEFAULT_RADIUS)),
      child: ExpansionTile(
        title: Text(title, style: TextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
        collapsedIconColor: scribblrPrimaryColor,
        iconColor: scribblrPrimaryColor,
        children: [
          Divider(height: 5, color: borderColor),
          Text(
            childrenText,
            style: appStore.isDarkModeOn ? TextStyle(color: Colors.white) : secondarytextStyle(),
          ).paddingSymmetric(horizontal: 16),
        ],
      ),
    ).paddingSymmetric(horizontal: 16, vertical: 16);
  }
}
