import 'package:flutter/material.dart';
import '../../../main.dart';
import '../utils/colors.dart';


class DynamicProgressBar extends StatefulWidget implements PreferredSizeWidget {
  final int currentScreenIndex;

  DynamicProgressBar({Key? key, required this.currentScreenIndex}) : super(key: key);

  @override
  _DynamicProgressBarState createState() => _DynamicProgressBarState();

  @override
  Size get preferredSize => Size.fromHeight(6.0);
}

class _DynamicProgressBarState extends State<DynamicProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LinearProgressIndicator(
        borderRadius: BorderRadius.circular(20),
        minHeight: 12,
        value: (widget.currentScreenIndex + 1) / 5,
        backgroundColor: appStore.isDarkModeOn ? Color(0xFF1F222A) :Colors.black12,
        valueColor: AlwaysStoppedAnimation<Color>(scribblrPrimaryColor),
      ),
    );
  }
}
