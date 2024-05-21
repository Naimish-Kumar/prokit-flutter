import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../components/new_article_component.dart';
import '../components/text_styles.dart';
import '../models/article_model.dart';

class ProfileArticles extends StatefulWidget {
  const ProfileArticles({super.key});

  @override
  State<ProfileArticles> createState() => _ProfileArticlesState();
}

class _ProfileArticlesState extends State<ProfileArticles> {
  List<ArticleModel> articleList = getYourArticleModelList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: context.scaffoldBackgroundColor,
        backgroundColor: context.scaffoldBackgroundColor,
        title: Text('Articles', style: primarytextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
      ),
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: articleList.validate().length,
              itemBuilder: (context, index) {
                return NewArticleComponent(newArticleResponseData: articleList.validate()[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
