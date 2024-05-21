import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../components/cached_image_widget.dart';
import '../../../utils/colors.dart';
import '../../../utils/constant.dart';
import '../artist_detail_screen.dart';
import '../model/artists_followed_list_model.dart';

class ArtistsFollowedListScreen extends StatefulWidget {
  final bool? isFromSearch;

  ArtistsFollowedListScreen({this.isFromSearch = false});

  @override
  _ArtistsFollowedListScreenState createState() => _ArtistsFollowedListScreenState();
}

class _ArtistsFollowedListScreenState extends State<ArtistsFollowedListScreen> {
  List<ArtistsFollowedListModel> artistsFollowedList = getArtistsFollowedList();

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
    return AnimatedListView(
      itemCount: artistsFollowedList.length,
      listAnimationType: ListAnimationType.Slide,
      padding: widget.isFromSearch.validate() ? EdgeInsets.only(top: 16) : null,
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        ArtistsFollowedListModel artistsData = artistsFollowedList[index];
        return SettingItemWidget(
          title: artistsData.artistName.validate(),
          titleTextStyle: boldTextStyle(color: whiteColor),
          padding: widget.isFromSearch.validate() ? EdgeInsets.symmetric(horizontal: 16, vertical: 10) : EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          trailing: widget.isFromSearch.validate() ? Offstage() : Icon(Icons.more_vert, size: 20, color: whiteColor).onTap(() {}, borderRadius: radius(DEFAULT_RADIUS)),
          splashColor: lightPurple.withOpacity(0.3),
          hoverColor: lightPurple.withOpacity(0.3),
          onTap: () {
            if (widget.isFromSearch.validate()) hideKeyboard(context);
            ArtistDetailScreen(artistData: artistsData).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
          },
          leading: CachedImageWidget(
            url: artistsData.artistImg.validate(),
            height: 55,
            fit: BoxFit.cover,
            width: 55,
            radius: 100,
          ),
        );
      },
    );
  }
}
