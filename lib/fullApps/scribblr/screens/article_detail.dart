import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../main.dart';
import '../components/chip_component.dart';
import '../components/comment_component.dart';
import '../components/text_styles.dart';
import '../models/article_model.dart';
import '../utils/colors.dart';
import 'comments.dart';

class ArticleDetail extends StatefulWidget {
  final ArticleModel articleData;

  ArticleDetail({required this.articleData});

  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark,
    ));
    return Observer(builder: (context) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.articleData.imageAsset.validate(),
                fit: BoxFit.cover,
                height: context.height() * 0.4,
                width: context.width(),
              ),
              10.height,
              Text(
                widget.articleData.title.validate(),
                style: primarytextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
              ).paddingSymmetric(horizontal: 16),
              10.height,
              Divider(color: dividerDarkColor, thickness: appStore.isDarkModeOn ? 0.3 : 0.2)
                  .paddingSymmetric(horizontal: 16),
              10.height,
              Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(widget.articleData.authorImage.validate()),
                          fit: BoxFit.cover),
                    ),
                  ).paddingSymmetric(horizontal: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.articleData.authorName.validate(), style: notifiTitleTextStyle()),
                      Text(widget.articleData.authorUserName.validate(),
                          style: secondarytextStyle()),
                    ],
                  ),
                  Spacer(),
                  ChipComponent(unselectedText: 'Follow', selectedText: 'Following')
                      .paddingSymmetric(horizontal: 16),
                ],
              ),
              10.height,
              Divider(color: dividerDarkColor, thickness: appStore.isDarkModeOn ? 0.3 : 0.2)
                  .paddingSymmetric(horizontal: 16),
              10.height,
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: scribblrPrimaryColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(widget.articleData.category.validate(), style: usertextStyle()),
                  ),
                  12.width,
                  Text(widget.articleData.time.validate(), style: timetextStyle()),
                ],
              ).paddingOnly(left: 16),
              10.height,
              Text(
                widget.articleData.articleContent.validate(),
                textAlign: TextAlign.justify,
                style: TextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
              ).paddingSymmetric(horizontal: 16),
              10.height,
              Divider(color: dividerDarkColor, thickness: appStore.isDarkModeOn ? 0.3 : 0.2)
                  .paddingSymmetric(horizontal: 16),
              10.height,
              Row(
                children: [
                  Text('Comments',
                          style: primarytextStyle(
                              color: appStore.isDarkModeOn ? Colors.white : Colors.black))
                      .expand(),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        CommentScreen(commentList: widget.articleData.commentList).launch(context);
                      },
                      icon: Icon(Icons.arrow_forward_outlined, color: scribblrPrimaryColor))
                ],
              ).paddingSymmetric(horizontal: 16),
              10.height,
              ...widget.articleData.commentList.validate().map(
                    (e) => CommentComponent(commentData: e),
                  ),
              40.height,
            ],
          ),
        ),
      );
    });
  }
}
