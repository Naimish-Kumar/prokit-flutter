import 'package:prokit_flutter/fullApps/flixv2/utils/constants.dart';

class WalkthroughModel {
  String? title;
  String? subtitle;
  String? walkthroughImage;

  WalkthroughModel({
    this.title,
    this.subtitle,
    this.walkthroughImage,
  });
}

List<WalkthroughModel> getWalkthroughData() {
  List<WalkthroughModel> walkthroughData = [];
  walkthroughData.add(
    WalkthroughModel(
        title: 'Get Information About\nMovies And Series',
        walkthroughImage: WALKTHROUGH_FIRST,
        subtitle: 'We have prepared complete information about latest movies and series for you.'),
  );
  walkthroughData.add(
    WalkthroughModel(
      title: 'Never miss\nnew movies & series',
      walkthroughImage: WALKTHROUGH_SECOND,
      subtitle: 'Be the first one to watch latest movies & series on Movia',
    ),
  );
  walkthroughData.add(
    WalkthroughModel(
      title: 'Never miss\nnew movies & series',
      walkthroughImage: WALKTHROUGH_THIRD,
      subtitle: 'Be the first one to watch latest movies & series on Movia',
    ),
  );

  return walkthroughData;
}
/*
*


*/
