import 'package:flutter/material.dart';

import '../../../main.dart';
import 'color.dart';

InputDecoration inputDecoration({required String hintText, bool? filled, Widget? suffixIcon, Widget? prefixIcon, InputBorder? border, InputBorder? enabledBorder, InputBorder? focusedBorder, Color? fillColor, Color? focusColor}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: proScanTextSecondaryColor),
    border: border ?? UnderlineInputBorder(borderSide: BorderSide(color: proScanPrimaryColor)),
    enabledBorder: enabledBorder ?? UnderlineInputBorder(borderSide: BorderSide(color: proScanPrimaryColor)),
    disabledBorder: border ?? UnderlineInputBorder(borderSide: BorderSide(color: proScanPrimaryColor)),
    focusedBorder: focusedBorder ?? UnderlineInputBorder(borderSide: BorderSide(color: proScanPrimaryColor)),
    errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    filled: filled,
    fillColor: fillColor,
    focusColor: proScanPrimaryColor,
    counterText: "",
  );
}

TextStyle primaryTextStyle({double? fontSize, Color? color}) {
  if (appStore.isDarkModeOn) {
    return TextStyle(fontSize: fontSize ?? 18, color: color ?? proScanDarkTextPrimaryColor);
  } else {
    return TextStyle(fontSize: fontSize ?? 18, color: color ?? proScanTextPrimaryColor);
  }
}

TextStyle secondaryTextStyle({double? fontSize, Color? color}) {
  if (appStore.isDarkModeOn) {
    return TextStyle(fontSize: fontSize ?? 14, color: color ?? proScanDarkTextSecondaryColor);
  } else {
    return TextStyle(fontSize: fontSize ?? 14, color: color ?? proScanTextSecondaryColor);
  }
}

TextStyle boldTextStyle({double? fontSize, Color? color}) {
  if (appStore.isDarkModeOn) {
    return TextStyle(fontSize: fontSize ?? 16, fontWeight: FontWeight.bold, color: color ?? proScanDarkTextBoldColor);
  } else {
    return TextStyle(fontSize: fontSize ?? 16, fontWeight: FontWeight.bold, color: color ?? proScanTextBoldColor);
  }
}

String? nameValidator(String value) {
  if (value.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
    return "Enter Name";
  } else {
    return null;
  }
}
