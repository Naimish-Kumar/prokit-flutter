import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main/utils/AppColors.dart';

class CommonAppIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool expandedText;
  final String icon;
  final String? text;
  final double? iconHeight;
  final double? iconWidth;

  CommonAppIconButton({
    required this.onPressed,
    required this.icon,
    this.text,
    this.iconHeight,
    this.iconWidth,
    this.expandedText = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: onPressed,
      child: TextIcon(
        text: text.validate(),
        textStyle: boldTextStyle(size: 14, color: Colors.white),
        spacing: 8,
        expandedText: expandedText,
        prefix: Image.asset(icon, height: iconHeight ?? 14, width: iconWidth ?? 14, color: Colors.white),
      ),
      color: appColorPrimary,
      width: context.width(),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    );
  }
}
