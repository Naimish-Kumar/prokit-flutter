import '../utils/constant.dart';
import '../utils/images.dart';

class CommentModel {
  final String? userImage;
  final String? userName;
  final String? comment;
  final bool isLiked;

  CommentModel({
    this.userImage,
    this.comment,
    this.userName,
    this.isLiked = false,
  });
}

List<CommentModel> getCommentModelList() {
  List<CommentModel> commentList = [];
  commentList.add(
    CommentModel(
      isLiked: false,
      userImage: AuthorImage.authElina,
      userName: AuthorName.authElina,
      comment: UserComment.authElina,
    ),
  );
  commentList.add(
    CommentModel(
      isLiked: false,
      userImage: AuthorImage.authChris,
      userName: AuthorName.authChris,
      comment: UserComment.authChris,
    ),
  );
  commentList.add(
    CommentModel(
      isLiked: false,
      userImage: AuthorImage.authStark,
      userName: AuthorName.authStark,
      comment: UserComment.authStark,
    ),
  );

  return commentList;
}
