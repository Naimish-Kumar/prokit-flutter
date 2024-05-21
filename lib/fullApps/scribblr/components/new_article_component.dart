import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/article_model.dart';
import '../screens/article_detail.dart';
import 'text_styles.dart';

class NewArticleComponent extends StatefulWidget {
  final ArticleModel newArticleResponseData;

  const NewArticleComponent({required this.newArticleResponseData});

  @override
  State<NewArticleComponent> createState() => _NewArticleComponentState();
}

class _NewArticleComponentState extends State<NewArticleComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ArticleDetail(articleData: widget.newArticleResponseData).launch(context);
      },
      child: Container(
        child: Column(children: [
          Row(
            children: [
              Image.asset(
                widget.newArticleResponseData.imageAsset.validate(),
                fit: BoxFit.cover,
                height: context.width() / 2 - 100,
                width: context.width() / 2 - 100,
              ).cornerRadiusWithClipRRect(20),
              16.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.height,
                  Text(widget.newArticleResponseData.title.validate(), style: notifiTitleTextStyle()),
                  10.height,
                  Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage(widget.newArticleResponseData.authorImage.validate()), fit: BoxFit.cover),
                        ),
                      ),
                      8.width,
                      Text(widget.newArticleResponseData.authorName.validate(), style: usertextStyle(), overflow: TextOverflow.ellipsis),
                    ],
                  ),
                  10.height,
                  Text(widget.newArticleResponseData.time.validate(), style: secondarytextStyle()),
                ],
              ).expand(),
            ],
          ),
        ]),
      ).paddingSymmetric(horizontal: 12, vertical: 8),
    );
  }
}
