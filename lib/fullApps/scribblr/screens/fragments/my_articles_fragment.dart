import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../components/new_article_component.dart';
import '../../models/article_model.dart';

class MyArticlesFragment extends StatefulWidget {
  const MyArticlesFragment({super.key});

  @override
  State<MyArticlesFragment> createState() => _MyArticlesFragmentState();
}

class _MyArticlesFragmentState extends State<MyArticlesFragment> {
  List<ArticleModel> articleList = getYourArticleModelList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
