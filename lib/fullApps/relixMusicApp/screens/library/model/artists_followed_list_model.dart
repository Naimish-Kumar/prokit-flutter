import '../../../utils/images.dart';

class ArtistsFollowedListModel {
  String? artistImg;
  String? artistName;
  String? noOfLikes;
  bool? isFollow;
  bool? isLike;

  ArtistsFollowedListModel({this.artistImg, this.artistName, this.noOfLikes, this.isLike = false, this.isFollow = false});
}

List<ArtistsFollowedListModel> getArtistsFollowedList() {
  List<ArtistsFollowedListModel> temp = [];

  temp.add(ArtistsFollowedListModel(artistImg: ariana_grande_artists, artistName: 'Ariana Grande', noOfLikes: '400m listeners', isLike: true, isFollow: true));
  temp.add(ArtistsFollowedListModel(artistImg: dua_lipa_art, artistName: 'Dua Lipa', noOfLikes: '300m listeners', isLike: true, isFollow: true));
  temp.add(ArtistsFollowedListModel(artistImg: selena_gomez_art, artistName: 'Selena Gomez', noOfLikes: '200m listeners', isLike: true, isFollow: true));
  temp.add(ArtistsFollowedListModel(artistImg: ed_sheeran_art, artistName: 'Ed Sheeran', noOfLikes: '100m listeners', isLike: true, isFollow: true));
  temp.add(ArtistsFollowedListModel(artistImg: justin_bieber_art, artistName: 'Justin Bieber', noOfLikes: '500m listeners', isLike: true, isFollow: true));
  temp.add(ArtistsFollowedListModel(artistImg: olivia_rodrigo_art, artistName: 'Olivia Rodrigo', noOfLikes: '300m listeners', isLike: true, isFollow: true));
  temp.add(ArtistsFollowedListModel(artistImg: taylor_swift_art, artistName: 'Taylor Swift', noOfLikes: '200m listeners', isLike: true, isFollow: true));
  temp.add(ArtistsFollowedListModel(artistImg: billie_eilish_art, artistName: 'Billie Eilish', noOfLikes: '100m listeners', isLike: true, isFollow: true));
  temp.add(ArtistsFollowedListModel(artistImg: charlie_puth_art, artistName: 'Charlie Puth', noOfLikes: '400m listeners', isLike: true, isFollow: true));
  temp.add(ArtistsFollowedListModel(artistImg: alan_walker_artists, artistName: 'Alan Walker', noOfLikes: '400m listeners', isLike: true, isFollow: true));
  temp.add(ArtistsFollowedListModel(artistImg: akon_artists, artistName: 'Akon', noOfLikes: '400m listeners', isLike: true, isFollow: true));

  return temp;
}
