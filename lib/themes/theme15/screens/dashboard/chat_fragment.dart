import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ChatFragment extends StatelessWidget {
  const ChatFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Chat Screen", style: boldTextStyle(size: 24)),
      ),
    );
  }
}
