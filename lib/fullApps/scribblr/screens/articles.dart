import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../components/article_component.dart';
import '../components/text_styles.dart';
import '../models/article_model.dart';

class ArticleListScreen extends StatefulWidget {
  final List<ArticleModel>? articleList;
  final String title;

  const ArticleListScreen({required this.articleList, required this.title});

  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
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
                  (e) => ArticleComponent(
                    height: 150,
                    articleResponseData: e,
                    width: context.width() / 2 - 36,
                  ),
                )
                .toList(),
          ),
        ),
      );
    });
  }
}
