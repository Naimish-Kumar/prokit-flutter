import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../components/cached_image_widget.dart';
import '../../../components/view_all_label_component.dart';
import '../../../utils/images.dart';

class PodcastFollowedComponent extends StatelessWidget {
  final List<String> podcastImgList = [talk_house_podcast, wrong_about_podcast, ted_talks_podcast, ranveer_show_podcast, talk_house_podcast];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewAllLabel(
          label: 'Followed',
          labelSize: 16,
          style: primaryTextStyle(color: whiteColor),
          onTap: () {
            //
          },
        ).paddingSymmetric(horizontal: 16),
        12.height,
        HorizontalList(
          itemCount: podcastImgList.length,
          spacing: 16,
          runSpacing: 0,
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            return CachedImageWidget(
              url: podcastImgList[index],
              height: 70,
              fit: BoxFit.cover,
              width: 70,
              radius: 80,
            );
          },
        )
      ],
    );
  }
}
