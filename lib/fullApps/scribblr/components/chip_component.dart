import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/colors.dart';

class ChipComponent extends StatefulWidget {
  final String selectedText;
  final String unselectedText;

  const ChipComponent({required this.selectedText, required this.unselectedText});

  @override
  State<ChipComponent> createState() => _ChipComponentState();
}

class _ChipComponentState extends State<ChipComponent> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Chip(
        side: BorderSide(style: BorderStyle.solid, color: scribblrPrimaryColor),
        label: Text(
          _isSelected ? widget.selectedText : widget.unselectedText,
          style: TextStyle(fontSize: 12, color: _isSelected ? scribblrPrimaryColor : Colors.white),
        ),
        backgroundColor: _isSelected ? context.scaffoldBackgroundColor : scribblrPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
