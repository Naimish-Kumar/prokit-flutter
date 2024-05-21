import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../components/app_scaffold.dart';
import '../../utils/common.dart';
import '../../utils/images.dart';
import 'component/download_episodes_list_screen.dart';

class DownloadEpisodesScreen extends StatefulWidget {
  @override
  _DownloadEpisodesScreenState createState() => _DownloadEpisodesScreenState();
}

class _DownloadEpisodesScreenState extends State<DownloadEpisodesScreen> {
  List<String> episodesChipList = ['Downloaded', 'Saved', 'Unplayed', 'Continue Listening'];

  String selectedEpisodesChipText = '';

  int selectedEpisodesChipIndex = 0;

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
    return AppScaffold(
      appBar: commonAppBarWidget(
        context,
        title: 'Downloaded Episodes',
        actionWidget1: IconButton(
          icon: Image.asset(ic_sort_arrow, height: 22, width: 22, color: Colors.white),
          onPressed: () {
            //
          },
        ),
      ),
      body: AnimatedScrollView(
        padding: EdgeInsets.only(bottom: 30),
        physics: AlwaysScrollableScrollPhysics(),
        listAnimationType: ListAnimationType.Slide,
        fadeInConfiguration: FadeInConfiguration(duration: 2.seconds),
        children: [
          HorizontalList(
            itemCount: episodesChipList.length,
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  selectedEpisodesChipIndex = index;
                  if (index == selectedEpisodesChipIndex) {
                    selectedEpisodesChipText = episodesChipList[index];
                  }
                  setState(() {});
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: boxDecorationDefault(
                    borderRadius: radius(20),
                    color: index == selectedEpisodesChipIndex ? Colors.grey.withAlpha(80) : Colors.grey.withAlpha(25),
                    gradient: index == selectedEpisodesChipIndex ? primaryHomeLinearGradient() : null,
                    boxShadow: defaultBoxShadow(blurRadius: 0, shadowColor: Colors.black.withAlpha(20)),
                  ),
                  child: Text(episodesChipList[index], style: primaryTextStyle(size: 14, color: whiteColor)),
                ),
              );
            },
          ),
          22.height,
          if (selectedEpisodesChipIndex == 0 || selectedEpisodesChipText == 'Downloaded') DownloadEpisodesListScreen(),
          if (selectedEpisodesChipText == 'Saved') DownloadEpisodesListScreen(),
          if (selectedEpisodesChipText == 'Unplayed') DownloadEpisodesListScreen(),
          if (selectedEpisodesChipText == 'Continue Listening') DownloadEpisodesListScreen(),
        ],
      ),
    );
  }
}
