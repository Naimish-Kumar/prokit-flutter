import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main.dart';
import '../../components/article_component.dart';
import '../../components/explore_component.dart';
import '../../components/new_article_component.dart';
import '../../components/text_styles.dart';
import '../../components/top_writers_component.dart';
import '../../models/article_model.dart';
import '../../utils/colors.dart';
import '../../utils/constant.dart';
import '../articles.dart';
import '../top_writers.dart';
import '../topic_explores.dart';

class DiscoverFragment extends StatefulWidget {
  List<ArticleModel>? articleList;

  DiscoverFragment({this.articleList});

  @override
  State<DiscoverFragment> createState() => _DiscoverFragmentState();
}

class _DiscoverFragmentState extends State<DiscoverFragment> {
  List<ArticleResponse> articleList = getDiscoverResponse();

  List<ArticleModel> getList(String listType) {
    if (listType == articleList)
      return articleList
          .firstWhere((element) => element.listType == articleList)
          .articleList
          .validate();
    else if (listType == explore_by_topics)
      return articleList
          .firstWhere((element) => element.listType == explore_by_topics)
          .articleList
          .validate();
    else if (listType == top_writers)
      return articleList
          .firstWhere((element) => element.listType == top_writers)
          .articleList
          .validate();
    else if (listType == recommendation)
      return articleList
          .firstWhere((element) => element.listType == recommendation)
          .articleList
          .validate();
    else if (listType == new_article)
      return articleList
          .firstWhere((element) => element.listType == new_article)
          .articleList
          .validate();
    else
      return [];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          ...articleList.map((e) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      e.title.validate(),
                      style: primarytextStyle(
                          color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
                    ).expand(),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (e.listType != top_writers && e.listType != explore_by_topics)
                          ArticleListScreen(
                            articleList: e.articleList,
                            title: e.title.validate(),
                          ).launch(context);
                        else if (e.listType == top_writers)
                          TopWritersScreen(
                            articleList: e.articleList.validate(),
                            title: e.title.validate(),
                          ).launch(context);
                        else if (e.listType == explore_by_topics)
                          TopicExploreScreen(
                            articleList: e.articleList.validate(),
                            title: e.title.validate(),
                          ).launch(context);
                      },
                      icon: Icon(Icons.arrow_forward_outlined, color: scribblrPrimaryColor),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 16),
                if (e.listType != new_article)
                  HorizontalList(
                      itemCount: e.articleList.validate().length,
                      itemBuilder: (context, index) {
                        if (e.listType == most_popular)
                          return ArticleComponent(
                            articleResponseData: e.articleList.validate()[index],
                          );
                        else if (e.listType == explore_by_topics)
                          return ExploreComponent(
                            articleResponseData: e.articleList.validate()[index],
                          );
                        else if (e.listType == top_writers)
                          return TopWritersComponent(
                            writerResponseData: e.articleList.validate()[index],
                          );
                        else if (e.listType == recommendation)
                          return ArticleComponent(
                            articleResponseData: e.articleList.validate()[index],
                          );
                        else
                          return Offstage();
                      }).paddingSymmetric(vertical: 10)
                else
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: e.articleList.validate().length,
                    itemBuilder: (context, index) {
                      return NewArticleComponent(
                          newArticleResponseData: e.articleList.validate()[index]);
                    },
                  ),
              ],
            );
          }).toList()
        ],
      ),
    );
  }
}
