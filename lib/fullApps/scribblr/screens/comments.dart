import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../components/comment_component.dart';
import '../components/text_styles.dart';
import '../models/comments_model.dart';

class CommentScreen extends StatefulWidget {
  final List<CommentModel>? commentList;

  CommentScreen({required this.commentList});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: context.scaffoldBackgroundColor,
        backgroundColor: context.scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
        title: Text('Comments', style: primarytextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.height,
            ...widget.commentList.validate().map((e) => CommentComponent(commentData: e)),
          ],
        ),
      ),
    );
  }
}
