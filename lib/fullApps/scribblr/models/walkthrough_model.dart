import '../../../main.dart';
import '../utils/images.dart';

class WalkModel {
  String Function() imagePath;
  String title;
  String subtitle;

  WalkModel(this.imagePath, this.title, this.subtitle);
}

List<WalkModel> walkthroughList = [
  WalkModel(
          () => appStore.isDarkModeOn ? home_dark : home_light,
      'Read interesting articles \nevery single day!',
      'With Scribblr read amazing articles \neveryday and explore something new...'),
  WalkModel(
          () => appStore.isDarkModeOn ? create_dark : create_light,
      'Create & publish your \nown articles to the world!',
      'Create and publish amazing articles \nwith aesthetic experience...'),
  WalkModel(
          () => appStore.isDarkModeOn ? profile_dark : profile_light,
      "Let's connect with others \nright now!",
      'Connect with amazing people around \nthe globe and learn everyday...'),
];
