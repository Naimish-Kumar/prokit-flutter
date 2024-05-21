import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../components/cached_image_widget.dart';
import '../../../components/view_all_label_component.dart';
import '../../library/podcast_detail_screen.dart';
import '../model/search_data_model.dart';

class PodcastsSearchComponent extends StatelessWidget {
  final List<SearchDataModel> getSearchPodcastList = getPodcastsList();
  final List<SearchDataModel> getSearchEpisodesList = getEpisodesList();

  @override
  Widget build(BuildContext context) {
    return AnimatedScrollView(
      crossAxisAlignment: CrossAxisAlignment.start,
      padding: EdgeInsets.only(top: 30),
      children: [
        ViewAllLabel(label: 'Podcasts', isShowAll: false).paddingSymmetric(horizontal: 16),
        16.height,
        HorizontalList(
          spacing: 16,
          runSpacing: 0,
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemCount: getSearchPodcastList.length,
          itemBuilder: (context, index) {
            SearchDataModel podcastListData = getSearchPodcastList[index];
            return GestureDetector(
              onTap: () {
                hideKeyboard(context);
                PodcastDetailScreen(podCastListData: podcastListData).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
              },
              child: Container(
                width: 130,
                decoration: boxDecorationDefault(
                  color: Colors.grey.withAlpha(25),
                  borderRadius: radius(18),
                  boxShadow: defaultBoxShadow(blurRadius: 0, shadowColor: Colors.black.withAlpha(20), spreadRadius: 0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedImageWidget(
                      url: podcastListData.img.validate(),
                      height: 130,
                      width: context.width(),
                      fit: BoxFit.cover,
                    ).cornerRadiusWithClipRRect(18).paddingAll(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(podcastListData.titleName.validate(), style: primaryTextStyle(color: whiteColor), maxLines: 2, overflow: TextOverflow.ellipsis),
                        6.height,
                        Marquee(child: Text(podcastListData.subTitleName.validate(), style: secondaryTextStyle())),
                      ],
                    ).paddingAll(10),
                  ],
                ),
              ),
            );
          },
        ),
        20.height,
        ViewAllLabel(label: 'Episodes', isShowAll: false).paddingSymmetric(horizontal: 16),
        16.height,
        AnimatedWrap(
          runSpacing: 16,
          itemCount: getSearchEpisodesList.length,
          itemBuilder: (ctx, index) {
            SearchDataModel getEpisodeListData = getSearchEpisodesList[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        CachedImageWidget(
                          url: getEpisodeListData.img.validate(),
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ).cornerRadiusWithClipRRect(12),
                      ],
                    ),
                    16.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(getEpisodeListData.titleName.validate(), style: boldTextStyle(color: whiteColor), maxLines: 2, overflow: TextOverflow.ellipsis),
                        Marquee(child: Text(getEpisodeListData.subTitleName.validate(), style: secondaryTextStyle())),
                        8.height,
                        RichTextWidget(
                          list: [
                            TextSpan(text: getEpisodeListData.episodeDate.validate(), style: secondaryTextStyle()),
                            if (getEpisodeListData.episodeDate.validate().isNotEmpty) TextSpan(text: ' | ', style: secondaryTextStyle()),
                            TextSpan(text: getEpisodeListData.episodeTime.validate(), style: secondaryTextStyle()),
                          ],
                        ),
                      ],
                    ).expand(),
                  ],
                ),
              ],
            );
          },
        ).paddingSymmetric(horizontal: 16),
      ],
    );
  }
}
