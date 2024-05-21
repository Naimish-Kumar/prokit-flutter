import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/workingApps/chatGPT/utils/constant.dart';

InputDecoration inputDecoration(
  BuildContext context, {
  Widget? prefixIcon,
  Widget? suffixIcon,
  String? label,
  String? labelText,
  double? borderRadius,
  Color? borderColor,
  EdgeInsetsGeometry? contentPadding,
}) {
  return InputDecoration(
    contentPadding: contentPadding ?? EdgeInsets.only(left: 16),
    hintText: label,
    labelText: labelText,
    labelStyle: secondaryTextStyle(),
    hintStyle: secondaryTextStyle(),
    alignLabelWithHint: true,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    border: InputBorder.none,
    filled: true,
    fillColor: appStore.isDarkModeOn ? null : context.cardColor,
    enabledBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide(color: borderColor ?? Colors.transparent, width: 0.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide(width: 0.0, color: borderColor ?? Colors.transparent),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide(color: Colors.red, width: 0.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide(color: Colors.red, width: 1.0),
    ),
    errorMaxLines: 2,
    errorStyle: primaryTextStyle(color: Colors.red, size: 12),
  );
}

Future<FirebaseRemoteConfig> setupFirebaseRemoteConfig() async {
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  remoteConfig.setConfigSettings(RemoteConfigSettings(fetchTimeout: Duration.zero, minimumFetchInterval: Duration.zero));
  await remoteConfig.fetch();
  await remoteConfig.fetchAndActivate();

  await setValue(CHAT_GPT_API_KEY, remoteConfig.getString(CHAT_GPT_API_KEY));
  await setValue(IN_APP_STORE_REVIEW, remoteConfig.getBool(IN_APP_STORE_REVIEW));

  return remoteConfig;
}
