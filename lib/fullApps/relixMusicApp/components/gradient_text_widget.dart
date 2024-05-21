import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/colors.dart';
import '../utils/gradient_text_widget.dart';

class GradientTextWidget extends StatelessWidget {
  final String text;

  GradientTextWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return GradientText(
      text,
      style: primaryTextStyle(),
      colors: [primaryMusicColor.withGreen(120), secondaryColor.withGreen(80).withOpacity(0.7)],
      gradientType: GradientType.linear,
    );
  }
}
