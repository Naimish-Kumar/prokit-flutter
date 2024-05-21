import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main.dart';
import '../../components/settings_component.dart';
import '../../components/text_styles.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          surfaceTintColor: context.scaffoldBackgroundColor,
          iconTheme:
              IconThemeData(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
          backgroundColor: context.scaffoldBackgroundColor,
          title: Text('Settings',
              style: primarytextStyle(
                  color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor)),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: settingComponent(context),
          ),
        ),
      );
    });
  }
}
