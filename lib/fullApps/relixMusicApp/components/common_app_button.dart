import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/common.dart';
import '../utils/constant.dart';

class CommonAppButton extends StatelessWidget {
  final String? btnText;
  final double? width;
  final double? height;
  final Gradient? gradient;
  final VoidCallback? onPressed;
  final Color? textColor;

  const CommonAppButton({Key? key, required this.onPressed, required this.btnText, this.width, this.height, this.gradient, this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.width(),
      height: height ?? 55.0,
      decoration: boxDecorationDefault(
        gradient: gradient ?? primaryHomeLinearGradient(),
        borderRadius: radius(DEFAULT_RADIUS),
        boxShadow: [BoxShadow(spreadRadius: 0, color: Colors.transparent)],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black.withOpacity(0.68),
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: radius(DEFAULT_RADIUS)),
        ),
        child: Text(btnText.validate(), style: primaryTextStyle(color: textColor ?? whiteColor)),
      ),
    );
  }
}
