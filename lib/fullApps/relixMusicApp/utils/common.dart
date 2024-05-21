import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'colors.dart';
import 'constant.dart';

Gradient primaryHomeLinearGradient({Color? firstColor, Color? secondColor}) {
  return LinearGradient(
    colors: [firstColor ?? primaryMusicColor, secondColor ?? secondaryColor.withRed(260)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0, 0.68],
  );
}

PreferredSizeWidget commonAppBarWidget(
  BuildContext context, {
  String? title,
  Widget? titleWidget,
  Widget? actionWidget1,
  Widget? actionWidget2,
  bool? showBack,
  bool isCenter = true,
}) {
  return appBarWidget(
    title ?? '',
    elevation: 0,
    textColor: Colors.white,
    color: Colors.transparent,
    titleWidget: title == '' ? titleWidget.validate() : null,
    showBack: showBack ?? true,
    center: isCenter,
    actions: [actionWidget1 ?? SizedBox(), actionWidget2 ?? SizedBox()],
  );
}

InputDecoration inputDecoration(BuildContext context, {Widget? prefixIcon, Widget? suffixIcon, String? label, double? borderRadius}) {
  return InputDecoration(
    contentPadding: EdgeInsets.only(left: 12, bottom: 16, top: 16, right: 10),
    hintText: label,
    hintStyle: secondaryTextStyle(color: Colors.grey),
    alignLabelWithHint: true,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    enabledBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? DEFAULT_RADIUS),
      borderSide: BorderSide(color: Colors.transparent, width: 0.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? DEFAULT_RADIUS),
      borderSide: BorderSide(color: Colors.red, width: 0.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? DEFAULT_RADIUS),
      borderSide: BorderSide(color: Colors.red, width: 1.0),
    ),
    errorMaxLines: 2,
    errorStyle: primaryTextStyle(color: Colors.red, size: 12),
    focusedBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? DEFAULT_RADIUS),
      borderSide: BorderSide(width: 0.0),
    ),
    filled: true,
    fillColor: Colors.grey.withAlpha(22),
  );
}
