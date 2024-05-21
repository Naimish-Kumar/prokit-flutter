import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main.dart';
import '../../components/text_styles.dart';
import '../../models/article_model.dart';
import '../../utils/colors.dart';

class SearchScreen extends StatefulWidget {
  final List<ArticleModel>? articleList;

  SearchScreen({this.articleList});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchCont = TextEditingController();

  bool showList = false;
  List<String> searchHistory = [
    'Travel',
    'Productivity',
    'Music',
    'Elina',
    'Chris',
    'Tips',
    'Science'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: context.scaffoldBackgroundColor,
            title: Text('Search',
                style:
                    primarytextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: borderColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: borderColor)),
                  child: TextField(
                    controller: searchCont,
                    onTap: () {
                      setState(() {
                        showList = true;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          searchCont.clear();
                          setState(() {
                            showList = false;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                10.height,
                Text('Previous Search',
                    style: TextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
                10.height,
                Divider(color: dividerDarkColor, thickness: appStore.isDarkModeOn ? 0.4 : 0.2),
                if (showList)
                  ...searchHistory
                      .map(
                        (item) => Text(item),
                      )
                      .toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
