import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/colors.dart';

class AppButtonSmall extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const AppButtonSmall({required this.text, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      child: AppButton(
        elevation: 0,
        onTap: onTap,
        color: scribblrPrimaryColor,
        shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Text(text, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      ),
    );
  }
}

class AppButtonLarge extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const AppButtonLarge({required this.text, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: context.width(),
      child: AppButton(
        elevation: 0,
        onTap: onTap,
        color: scribblrPrimaryColor,
        shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Text(text, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white)),
      ),
    );
  }
}
