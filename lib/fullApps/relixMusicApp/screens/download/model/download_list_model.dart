import '../../../utils/images.dart';

class DownloadSongListModel {
  String? image;
  String? day;
  String? time;
  String? message;
  String? itemName;
  String? itemType;
  String? podcastTime;
  bool? isLike;

  DownloadSongListModel({this.image, this.day, this.time, this.message, this.itemName, this.itemType, this.podcastTime, this.isLike});
}

List<DownloadSongListModel> getDownloadedSongList() {
  List<DownloadSongListModel> tempData = [];

  tempData.add(
    DownloadSongListModel(
      image: hall_of_fame,
      day: 'Today',
      time: '04:50 min',
      message: 'Hall of Fame',
      itemName: 'The Script',
      itemType: 'Single',
      isLike: true,
    ),
  );

  tempData.add(
    DownloadSongListModel(
      image: heat_waves,
      day: 'Yesterday',
      time: '01:20 min',
      message: 'Heat waves',
      itemName: 'Glass Animals',
      itemType: 'Single',
      isLike: true,
    ),
  );

  tempData.add(
    DownloadSongListModel(
      image: savage_love,
      day: 'Yesterday',
      time: '01:20 min',
      message: 'Savage love',
      itemName: 'Jason Derulo',
      itemType: 'Single',
      isLike: true,
    ),
  );

  return tempData;
}

List<DownloadSongListModel> getDownloadedEpisodesList() {
  List<DownloadSongListModel> tempEpisodesData = [];

  tempEpisodesData.add(
    DownloadSongListModel(
      image: life_lesson,
      time: '1 day ago',
      message: 'The secret to happy life-lessons from 8 de...',
      itemName: 'TED Talks Daily',
      itemType: 'Episode',
      isLike: true,
      podcastTime: '30 min',
    ),
  );

  tempEpisodesData.add(
    DownloadSongListModel(
      image: dear_investor_stay_still,
      time: '15 hrs ago',
      message: 'Dear Investor -Stay Still!',
      itemName: 'Finshots Daily',
      itemType: 'Episode',
      isLike: true,
      podcastTime: '20 min',
    ),
  );

  tempEpisodesData.add(
    DownloadSongListModel(
      image: ted_talks_podcast,
      time: '15 hrs ago',
      message: 'Let’s Talk About Mental Health',
      itemName: 'TED',
      itemType: 'Episode',
      isLike: true,
      podcastTime: '20 min',
    ),
  );

  return tempEpisodesData;
}
