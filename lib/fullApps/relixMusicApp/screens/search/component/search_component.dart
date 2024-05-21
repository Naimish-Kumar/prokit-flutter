import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/common.dart';
import '../../library/component/artists_followed_list_screen.dart';
import 'albums_search_component.dart';
import 'playlists_search_component.dart';
import 'podcasts_search_component.dart';
import 'songs_search_component.dart';
import 'top_search_component.dart';

class SearchComponent extends StatefulWidget {
  @override
  _SearchComponentState createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  List<String> searchOptionChipList = ['Top', 'Songs', 'Albums', 'Playlists', 'Podcasts', 'Artists'];

  String selectedOptionChipText = '';

  int selectedOptionChipIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScrollView(
      crossAxisAlignment: CrossAxisAlignment.start,
      padding: EdgeInsets.only(top: 8, bottom: 30),
      children: [
        HorizontalList(
          itemCount: searchOptionChipList.length,
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                hideKeyboard(context);
                selectedOptionChipIndex = index;
                if (index == selectedOptionChipIndex) {
                  selectedOptionChipText = searchOptionChipList[index];
                }
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: boxDecorationDefault(
                  borderRadius: radius(20),
                  color: index == selectedOptionChipIndex ? Colors.grey.withAlpha(80) : Colors.grey.withAlpha(25),
                  gradient: index == selectedOptionChipIndex ? primaryHomeLinearGradient() : null,
                  boxShadow: defaultBoxShadow(blurRadius: 0, shadowColor: Colors.black.withAlpha(20)),
                ),
                child: Text(searchOptionChipList[index], style: primaryTextStyle(size: 14, color: whiteColor)),
              ),
            );
          },
        ),
        if (selectedOptionChipIndex == 0 || selectedOptionChipText == 'Top') TopSearchComponent(),
        if (selectedOptionChipText == 'Songs') SongsSearchComponent(),
        if (selectedOptionChipText == 'Albums') AlbumsSearchComponent(),
        if (selectedOptionChipText == 'Playlists') PlayListsSearchComponent(),
        if (selectedOptionChipText == 'Podcasts') PodcastsSearchComponent(),
        if (selectedOptionChipText == 'Artists') ArtistsFollowedListScreen(isFromSearch: true),
      ],
    );
  }
}
