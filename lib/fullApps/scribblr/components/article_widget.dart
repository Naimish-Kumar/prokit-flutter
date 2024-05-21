import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../models/article_model.dart';
import '../screens/articles.dart';
import '../utils/colors.dart';
import 'article_component.dart';
import 'text_styles.dart';

class ArticleWidget extends StatefulWidget {
  final ArticleResponse articleResponseData;

  ArticleWidget({required this.articleResponseData});

  @override
  State<ArticleWidget> createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.articleResponseData.title.validate(),
              style: primarytextStyle(
                color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor,
              ),
            ).expand(),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                ArticleListScreen(
                  articleList: widget.articleResponseData.articleList.validate(),
                  title: widget.articleResponseData.title.validate(),
                ).launch(context);
              },
              icon: Icon(Icons.arrow_forward_outlined, color: scribblrPrimaryColor),
            ),
          ],
        ).paddingOnly(left: 16, right: 16, top: 16),
        HorizontalList(
          spacing: 16,
          itemCount: widget.articleResponseData.articleList.validate().length,
          itemBuilder: (context, index) {
            return ArticleComponent(articleResponseData: widget.articleResponseData.articleList.validate()[index]);
          },
        ),
      ],
    );
  }
}
