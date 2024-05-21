import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/article_model.dart';
import '../screens/explore_articles.dart';

class ExploreComponent extends StatefulWidget {
  final ArticleModel articleResponseData;
  final double? width;
  final double? height;

  ExploreComponent({required this.articleResponseData, this.width, this.height});

  @override
  State<ExploreComponent> createState() => _ExploreComponentState();
}

class _ExploreComponentState extends State<ExploreComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ExploreArticles(exploreData: widget.articleResponseData).launch(context);
      },
      child: Stack(
        children: [
          Image.asset(
            widget.articleResponseData.imageAsset.validate(),
            height: widget.height ?? 100,
            width: widget.width ?? 160,
            fit: BoxFit.cover,
          ).cornerRadiusWithClipRRect(10),
          Container(
            height: widget.height ?? 100,
            width: widget.width ?? 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 1.0],
                colors: [Colors.transparent, Colors.black45],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Text(
              widget.articleResponseData.title.validate(),
              style: primaryTextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 10,
            child: Text(
              widget.articleResponseData.subtitle.validate(),
              style: primaryTextStyle(color: Colors.white, size: 12),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 6),
    );
  }
}
