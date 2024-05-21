import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../models/comments_model.dart';
import '../utils/colors.dart';

class CommentComponent extends StatefulWidget {
  final CommentModel commentData;

  const CommentComponent({required this.commentData});

  @override
  State<CommentComponent> createState() => _CommentComponentState();
}

class _CommentComponentState extends State<CommentComponent> {
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLiked = widget.commentData.isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(widget.commentData.userImage.validate()), fit: BoxFit.cover),
                ),
              ).paddingSymmetric(horizontal: 16),
              Text(widget.commentData.userName.validate(), style: TextStyle(color: scribblrPrimaryColor)).expand(),
              IconButton(
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.redAccent : scribblrPrimaryColor,
                  size: 20,
                ),
              ),
            ],
          ),
          5.height,
          Text(
            widget.commentData.comment.validate(),
            style: TextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          ).paddingSymmetric(horizontal: 16),
        ],
      ),
    ).paddingSymmetric(vertical: 8);
  }
}
