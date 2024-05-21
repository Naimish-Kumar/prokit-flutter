import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CommonAppDividerWidget extends StatelessWidget {
  final String? text;
  final double? height;
  final double? thickness;

  CommonAppDividerWidget({this.text, this.height, this.thickness});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Divider(color: dividerDarkColor, thickness: thickness ?? 0, height: height.validate(value: 16)).expand(),
        if (text.validate().isNotEmpty) 8.width,
        if (text.validate().isNotEmpty) Text(text.validate(), style: primaryTextStyle(color: textSecondaryColorGlobal)),
        if (text.validate().isNotEmpty) 8.width,
        Divider(color: dividerDarkColor, thickness: thickness ?? 0, height: height.validate(value: 16)).expand(),
      ],
    );
  }
}
