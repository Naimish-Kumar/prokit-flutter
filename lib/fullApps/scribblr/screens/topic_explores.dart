import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../components/explore_component.dart';
import '../components/text_styles.dart';
import '../models/article_model.dart';

class TopicExploreScreen extends StatefulWidget {
  final String title;
  final List<ArticleModel> articleList;

  const TopicExploreScreen({super.key, required this.title, required this.articleList});

  @override
  State<TopicExploreScreen> createState() => _TopicExploreScreenState();
}

class _TopicExploreScreenState extends State<TopicExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          surfaceTintColor: context.scaffoldBackgroundColor,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          title: Text(widget.title, style: primarytextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
          backgroundColor: context.scaffoldBackgroundColor,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Wrap(
            runAlignment: WrapAlignment.center,
            runSpacing: 16,
            spacing: 16,
            children: widget.articleList
                .validate()
                .map(
                  (e) => ExploreComponent(width: context.width() / 2 - 36, height: 100, articleResponseData: e),
                )
                .toList(),
          ),
        ),
      );
    });
  }
}
