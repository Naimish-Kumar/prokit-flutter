import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'T15colors.dart';

class CommonTextButton extends StatelessWidget {
  CommonTextButton({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(visualDensity: VisualDensity.compact, padding: MaterialStatePropertyAll(EdgeInsets.zero)),
      child: Text(text, style: primaryTextStyle(size: 14, color: primarycolor)),
      onPressed: () {
        //
      },
    );
  }
}
