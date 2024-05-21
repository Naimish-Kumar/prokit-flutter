import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/relixMusicApp/utils/colors.dart';
import 'package:prokit_flutter/fullApps/relixMusicApp/utils/string_extensions.dart';

import '../../components/app_scaffold.dart';
import '../../components/cached_image_widget.dart';
import '../../components/icon_background_widget.dart';
import '../../components/view_all_label_component.dart';
import '../../utils/common.dart';
import '../../utils/images.dart';
import '../dashboard/fragment/artists_fragment.dart';
import '../dashboard/fragment/music_fragment.dart';
import '../dashboard/fragment/podcasts_fragment.dart';
import 'component/search_component.dart';
import 'model/search_data_model.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchCont = TextEditingController();

  FocusNode searchFocus = FocusNode();

  List<String> searchChipList = ['Artists', 'Music', 'Podcasts'];
  late List<SearchDataModel> getRecentSearchDataList;

  int selectSearchChipIndex = -1;

  String searchText = '';

  bool isTapToSearch = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    getRecentSearchDataList = getRecentSearchList();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget buildRecentSearchWidget() {
    return Column(
      children: [
        ViewAllLabel(
          label: 'Recent Searches',
          trailingText: 'Clear All',
          onTap: () {
            isTapToSearch = false;
            setState(() {});
          },
        ),
        AnimatedListView(
          itemCount: getRecentSearchDataList.length,
          listAnimationType: ListAnimationType.Slide,
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            SearchDataModel recentSearchData = getRecentSearchDataList[index];
            return SettingItemWidget(
              title: recentSearchData.titleName.validate(),
              titleTextStyle: boldTextStyle(color: whiteColor),
              subTitle: recentSearchData.subTitleName.validate(),
              padding: EdgeInsets.symmetric(vertical: 12),
              leading: CachedImageWidget(
                url: recentSearchData.img.validate(),
                height: 55,
                fit: BoxFit.cover,
                width: 55,
                radius: recentSearchData.subTitleName == 'Song' ? 8 : 80,
              ),
              trailing: Icon(Icons.close, size: 20, color: whiteColor).onTap(() {
                getRecentSearchDataList.removeAt(index);
                if (getRecentSearchDataList.isEmpty) {
                  isTapToSearch = false;
                }
                setState(() {});
              }),
            );
          },
        ),
      ],
    ).paddingSymmetric(horizontal: 16);
  }

  @override
  void dispose() {
    searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: commonAppBarWidget(context, title: 'Search'),
      body: Stack(
        children: [
          AnimatedScrollView(
            children: [
              AppTextField(
                controller: searchCont,
                focus: searchFocus,
                textFieldType: TextFieldType.OTHER,
                textInputAction: TextInputAction.done,
                textStyle: primaryTextStyle(color: Colors.white),
                cursorColor: primaryMusicColor,
                decoration: inputDecoration(
                  context,
                  label: 'Artists, songs, or podcasts',
                  prefixIcon: ic_search.iconImage(size: 10, color: Colors.white).paddingAll(14),
                  suffixIcon: ic_microphone.iconImage(size: 10, color: Colors.white).paddingAll(14),
                ),
                onChanged: (value) {
                  searchText = value;
                  setState(() {});
                },
              ).withHeight(50).paddingOnly(left: 16, right: 16, top: 16),
              16.height,
              if (searchText.isEmpty && !isTapToSearch)
                HorizontalList(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount: searchChipList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        hideKeyboard(context);
                        selectSearchChipIndex = index;
                        setState(() {});
                        if (selectSearchChipIndex == 0)
                          ArtistsFragment().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                        else if (selectSearchChipIndex == 1)
                          MusicFragment().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                        else
                          PodcastsFragment().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: boxDecorationDefault(
                          borderRadius: radius(20),
                          color: Colors.grey.withAlpha(25),
                          boxShadow: defaultBoxShadow(blurRadius: 0, shadowColor: Colors.black.withAlpha(20)),
                        ),
                        child: Text(searchChipList[index], style: primaryTextStyle(size: 14, color: whiteColor)),
                      ),
                    );
                  },
                )
              else if (searchText.isEmpty && isTapToSearch)
                buildRecentSearchWidget()
              else
                SearchComponent(),
            ],
          ),
          if (!isTapToSearch && searchText.isEmpty)
            Positioned(
              child: GestureDetector(
                onTap: () {
                  hideKeyboard(context);
                  isTapToSearch = true;
                  init();
                  setState(() {});
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconBackgroundWidget(
                      icon: ic_song_search_button,
                      color: Colors.grey.withAlpha(80),
                      gradient: primaryHomeLinearGradient(),
                      padding: 16,
                      width: 110,
                      height: 110,
                    ).cornerRadiusWithClipRRect(80),
                    30.height,
                    Text('Tap to Search', style: secondaryTextStyle()),
                  ],
                ),
              ).center(),
            ),
        ],
      ),
    );
  }
}
