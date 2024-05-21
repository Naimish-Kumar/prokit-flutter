import '../utils/constant.dart';
import '../utils/images.dart';

class InviteUserModel {
  final String? userName;
  final String? userImage;

  InviteUserModel({required this.userName, required this.userImage});
}

List<InviteUserModel> getInviteUserModelList() {
  List<InviteUserModel> userList = [];
  userList.add(InviteUserModel(
    userImage: AuthorImage.authElina,
    userName: AuthorName.authElina,
  ));

  userList.add(InviteUserModel(
    userImage: AuthorImage.authChris,
    userName: AuthorName.authChris,
  ));
  userList.add(InviteUserModel(
    userImage: AuthorImage.authStark,
    userName: AuthorName.authStark,
  ));
  userList.add(InviteUserModel(
    userImage: AuthorImage.authEliza,
    userName: AuthorName.authEliza,
  ));
  userList.add(InviteUserModel(
    userImage: AuthorImage.authNolan,
    userName: AuthorName.authNolan,
  ));

  return userList;
}
