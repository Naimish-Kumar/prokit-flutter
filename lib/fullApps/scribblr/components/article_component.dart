import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/scribblr/components/text_styles.dart';

import '../models/article_model.dart';
import '../screens/article_detail.dart';
import '../utils/colors.dart';

class ArticleComponent extends StatefulWidget {
  final ArticleModel articleResponseData;
  final double? width;
  final double? height;

  ArticleComponent({required this.articleResponseData, this.width, this.height});

  @override
  State<ArticleComponent> createState() => _ArticleComponentState();
}

class _ArticleComponentState extends State<ArticleComponent> {
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ArticleDetail(articleData: widget.articleResponseData).launch(context);
      },
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 1),
        width: widget.width ?? context.width() / 2 - 70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  widget.articleResponseData.imageAsset.validate(),
                  fit: BoxFit.cover,
                  height: widget.height ?? context.width() / 2 - 70,
                  width: widget.width ?? context.width() / 2 - 70,
                ).cornerRadiusWithClipRRect(20),
                Positioned(
                  right: 10,
                  top: 10,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isBookmarked = !_isBookmarked;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: scribblrPrimaryColor),
                      child: Icon(
                        _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            5.height,
            Text(
              widget.articleResponseData.title.validate(),
              style: articletextStyle(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            5.height,
            Row(
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage(widget.articleResponseData.authorImage.validate()), fit: BoxFit.cover),
                  ),
                ),
                3.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.articleResponseData.authorName.validate(),
                      style: usertextStyle(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(widget.articleResponseData.time.validate(), style: timetextStyle()),
                  ],
                ).expand(),
              ],
            ).paddingSymmetric(horizontal: 2),
          ],
        ),
      ).paddingSymmetric(horizontal: 6),
    );
  }
}
