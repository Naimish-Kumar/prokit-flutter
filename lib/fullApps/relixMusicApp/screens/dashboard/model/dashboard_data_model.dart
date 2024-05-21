import 'package:prokit_flutter/fullApps/relixMusicApp/utils/images.dart';

class DashBoardDataModel {
  String? img;
  String? trackTitle;
  String? trackSubTitle;
  String? podcastsTitle;

  DashBoardDataModel({this.img, this.trackTitle, this.trackSubTitle, this.podcastsTitle});
}

List<DashBoardDataModel> getRecentPlayedMusicList() {
  List<DashBoardDataModel> tempRecentPlayedList = [];

  tempRecentPlayedList.add(DashBoardDataModel(img: believer, trackTitle: 'Believer', trackSubTitle: 'Imagine Dragons'));
  tempRecentPlayedList.add(DashBoardDataModel(img: billionaire, trackTitle: 'Billionaire', trackSubTitle: 'Travie Mc Coy'));
  tempRecentPlayedList.add(DashBoardDataModel(img: let_me_love_you, trackTitle: 'Let Me Love You', trackSubTitle: 'Justin Bieber'));
  tempRecentPlayedList.add(DashBoardDataModel(img: believer, trackTitle: 'Believer', trackSubTitle: 'Imagine Dragons'));

  return tempRecentPlayedList;
}

List<DashBoardDataModel> getFavouriteMusicList() {
  List<DashBoardDataModel> tempFavouriteMusicList = [];

  tempFavouriteMusicList.add(DashBoardDataModel(img: cry_baby, trackTitle: 'Cry Baby', trackSubTitle: 'Melanie Martinez'));
  tempFavouriteMusicList.add(DashBoardDataModel(img: dua_lipa_art, trackTitle: 'Break My Hea..', trackSubTitle: 'Dua Lipa'));
  tempFavouriteMusicList.add(DashBoardDataModel(img: hall_of_fame, trackTitle: 'Hall Of Fame', trackSubTitle: 'The Script'));
  tempFavouriteMusicList.add(DashBoardDataModel(img: believer, trackTitle: 'Cry Baby', trackSubTitle: 'Melanie Martinez'));

  return tempFavouriteMusicList;
}

List<DashBoardDataModel> getPopularPodcastsList() {
  List<DashBoardDataModel> tempPopularPodcastsList = [];

  tempPopularPodcastsList.add(DashBoardDataModel(img: the_album_years_podcast, podcastsTitle: 'The Album Years : By Steven Wilson & Ti...'));
  tempPopularPodcastsList.add(DashBoardDataModel(img: ranveer_show_podcast, podcastsTitle: 'The Ranveer Show : By Ranveer Allah... '));
  tempPopularPodcastsList.add(DashBoardDataModel(img: women_money_podcast, podcastsTitle: 'Women & Money : By Suze Orman’s...'));
  tempPopularPodcastsList.add(DashBoardDataModel(img: becoming_podcast, podcastsTitle: 'Becoming : By The michelle obam...'));

  return tempPopularPodcastsList;
}

List<DashBoardDataModel> getTopPodcastsList() {
  List<DashBoardDataModel> tempTopPodcastsList = [];

  tempTopPodcastsList.add(DashBoardDataModel(img: dr_death_podcast, podcastsTitle: 'Dr. Death'));
  tempTopPodcastsList.add(DashBoardDataModel(img: today_explained_podcast, podcastsTitle: 'Today Explained'));
  tempTopPodcastsList.add(DashBoardDataModel(img: dr_death_podcast, podcastsTitle: 'Dr. Death'));

  return tempTopPodcastsList;
}

List<DashBoardDataModel> getFavoritesArtistsList() {
  List<DashBoardDataModel> tempFavoritesArtistsList = [];

  tempFavoritesArtistsList.add(DashBoardDataModel(img: ariana_grande_artists, podcastsTitle: 'Ariana Grande'));
  tempFavoritesArtistsList.add(DashBoardDataModel(img: g_eazy_art, podcastsTitle: 'Charlie Puth'));
  tempFavoritesArtistsList.add(DashBoardDataModel(img: olivia_rodrigo_art, podcastsTitle: 'Olivia Rodrigo'));

  return tempFavoritesArtistsList;
}
