import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/scribblr/utils/colors.dart';

import '../../../../main.dart';
import '../../components/article_widget.dart';
import '../../models/article_model.dart';
import '../../utils/images.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  List<ArticleResponse> articleList = getArticleResponse();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark,
    ));
    return Observer(builder: (context) {
      return SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 145,
                  width: context.width() - 32,
                  decoration: BoxDecoration(
                      color: Color(0xFFAC7B6B),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.height,
                      Text(
                        'Learn how to become a \ngreat writer right now!',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      15.height,
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                        onPressed: () {
                          //
                        },
                        child: Text(
                          'Read More',
                          style: TextStyle(color: scribblrPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 20,
                  child: Image.asset(girl, fit: BoxFit.cover, height: 200),
                )
              ],
            ),
            15.height,
            ...articleList.map((e) => ArticleWidget(articleResponseData: e)).toList()
          ],
        ),
      );
    });
  }
}
