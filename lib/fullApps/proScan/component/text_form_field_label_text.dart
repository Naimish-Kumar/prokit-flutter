import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/common.dart';

class TextFormFieldLabelText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  TextFormFieldLabelText({Key? key, required this.text, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.centerLeft, child: Text(text, style: style ?? boldTextStyle()));
  }
}
