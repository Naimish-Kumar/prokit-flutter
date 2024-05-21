import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../components/text_styles.dart';
import '../models/article_model.dart';
import '../utils/colors.dart';
import 'profile_view.dart';

class TopWritersScreen extends StatefulWidget {
  final String title;
  final List<ArticleModel> articleList;

  const TopWritersScreen({super.key, required this.title, required this.articleList});

  @override
  State<TopWritersScreen> createState() => _TopWritersScreenState();
}

class _TopWritersScreenState extends State<TopWritersScreen> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          surfaceTintColor: context.scaffoldBackgroundColor,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          title: Text(
            widget.title,
            style: primarytextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          ),
          backgroundColor: context.scaffoldBackgroundColor,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Wrap(
                runAlignment: WrapAlignment.center,
                runSpacing: 16,
                spacing: 16,
                children: List.generate(
                  widget.articleList.length,
                  (index) {
                    ArticleModel data = widget.articleList[index];
                    return WritersComponent(index: (index + 1).toString(), data: data);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class WritersComponent extends StatefulWidget {
  final String index;
  ArticleModel data;

  WritersComponent({super.key, required this.index, required this.data});

  @override
  State<WritersComponent> createState() => _WritersComponentState();
}

class _WritersComponentState extends State<WritersComponent> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.index.validate()),
        16.width,
        GestureDetector(
          onTap: () {
            ProfileView(articleData: widget.data).launch(context);
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(widget.data.authorImage.validate()), fit: BoxFit.cover),
            ),
          ),
        ),
        16.width,
        Text(
          widget.data.authorName.validate(),
          style: TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
        ).expand(),
        GestureDetector(
          onTap: () {
            setState(() {
              _isSelected = !_isSelected;
            });
          },
          child: Chip(
            side: BorderSide(style: BorderStyle.solid, color: scribblrPrimaryColor),
            label: Text(
              _isSelected ? 'Following' : 'Follow',
              style: TextStyle(fontSize: 12, color: _isSelected ? scribblrPrimaryColor : Colors.white),
            ),
            backgroundColor: _isSelected ? context.scaffoldBackgroundColor : scribblrPrimaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ],
    );
  }
}
