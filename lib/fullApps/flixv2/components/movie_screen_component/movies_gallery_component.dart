import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/flixv2/components/video_component.dart';
import 'package:prokit_flutter/fullApps/flixv2/utils/videosdata.dart';


import '../../utils/common_widgets.dart';

class MoviesGalleryComponent extends StatefulWidget {
  State<MoviesGalleryComponent> createState() => MoviesGalleryComponentState();
}

class MoviesGalleryComponentState extends State<MoviesGalleryComponent> {
  List<VideoDataModel> movieClips = getMovieClips();

  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 16,
      children: [
        titleRowItem(title: 'Gallery', isSeeAll: false),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Wrap(
            spacing: 16,
            direction: Axis.horizontal,
            children: List.generate(movieClips.length, (index) {
              return Container(
                width: MediaQuery.of(context).size.width - 32,
                height: 200,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: VideoComponent(videoTitle: movieClips[index].videoTitle),
              );
            }),
          ),
        ),
      ],
    );
  }
} /* */
