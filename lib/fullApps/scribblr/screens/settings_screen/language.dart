import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main.dart';
import '../../components/language_select.dart';
import '../../components/text_styles.dart';

class LanguageSettings extends StatefulWidget {
  const LanguageSettings({super.key});

  @override
  State<LanguageSettings> createState() => _LanguageSettingsState();
}

class _LanguageSettingsState extends State<LanguageSettings> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
          appBar: AppBar(
            surfaceTintColor: context.scaffoldBackgroundColor,
            iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
            title: Text('Language', style: primarytextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
            backgroundColor: context.scaffoldBackgroundColor,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LanguageSelection(),
              ],
            ),
          ));
    });
  }
}
