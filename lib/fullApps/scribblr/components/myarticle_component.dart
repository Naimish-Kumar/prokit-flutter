import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


import 'text_styles.dart';

class MyArticleComponent extends StatelessWidget {
  final String imagePath;
  final String titleText;
  final String dateText;

  MyArticleComponent({required this.imagePath, required this.titleText, required this.dateText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecorationDefault(color: context.scaffoldBackgroundColor, boxShadow: List.empty()),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: context.width() / 2 - 110,
            width: context.width() / 2 - 110,
          ).cornerRadiusWithClipRRect(20),
          16.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titleText, style: notifiTitleTextStyle()),
              10.height,
              Text(dateText, style: secondarytextStyle()),
            ],
          ).expand(),
        ],
      ),
    ).paddingSymmetric(vertical: 8);
  }
}
