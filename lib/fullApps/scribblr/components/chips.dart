import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/colors.dart';

class CustomChips extends StatefulWidget {
  final String label;

  const CustomChips({Key? key, required this.label}) : super(key: key);

  @override
  _SelectableChipState createState() => _SelectableChipState();
}

class _SelectableChipState extends State<CustomChips> {
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
        label: Text(widget.label, style: TextStyle(fontSize: 12, color: _isSelected ? Colors.white : scribblrPrimaryColor)),
        backgroundColor: _isSelected ? scribblrPrimaryColor : context.scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
