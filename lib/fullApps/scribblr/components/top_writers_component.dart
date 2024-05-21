import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../screens/profile_view.dart';
import '../utils/colors.dart';

import '../models/article_model.dart';

class TopWritersComponent extends StatefulWidget {
  final ArticleModel writerResponseData;
  final double? width;
  final double? height;

  const TopWritersComponent({required this.writerResponseData, this.width, this.height});

  @override
  State<TopWritersComponent> createState() => _TopWritersComponentState();
}

class _TopWritersComponentState extends State<TopWritersComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ProfileView(articleData: widget.writerResponseData).launch(context);
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: widget.height ?? 100,
              width: widget.width ?? 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(widget.writerResponseData.authorImage.validate()), fit: BoxFit.cover),
              ),
            ),
            10.height,
            Text(
              widget.writerResponseData.authorName.validate(),
              textAlign: TextAlign.center,
              style: TextStyle(color: scribblrPrimaryColor),
            ),
          ],
        ),
      ).paddingSymmetric(horizontal: 8),
    );
  }
}
