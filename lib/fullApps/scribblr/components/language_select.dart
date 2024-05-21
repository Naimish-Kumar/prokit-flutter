import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../utils/colors.dart';
import 'text_styles.dart';

class LanguageSelection extends StatefulWidget {
  @override
  _LanguageSelectionState createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  Map<String, bool> languageValues = {
    'English (US)': false,
    'English (UK)': false,
    'Mandarin': false,
    'Hindi': false,
    'Bengali': false,
    'Arabic': false,
    'French': false,
    'Spanish': false,
    'Indonesia': false,
  };

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text(
          'Select Language',
          style: primarytextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
        ),
        10.height,
        ...buildLanguageRows(languageValues),
      ],
    );
  }

  List<Widget> buildLanguageRows(Map<String, bool> values) {
    return values.keys.map((String key) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: LanguageRow(
          language: key,
          selected: values[key]!,
          onChanged: (bool value) {
            setState(() {
              values.forEach((key, value) {
                values[key] = false;
              });
              values[key] = value;
            });
          },
        ),
      );
    }).toList();
  }
}

class LanguageRow extends StatelessWidget {
  final String language;
  final bool selected;
  final ValueChanged<bool> onChanged;

  const LanguageRow({
    Key? key,
    required this.language,
    required this.selected,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile<bool>(
      title: Text(
        language,
        style: TextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
      ),
      value: true,
      groupValue: selected,
      onChanged: (bool? value) {
        onChanged(value!);
      },
      activeColor: scribblrPrimaryColor,
      secondary: selected
          ? Icon(
              Icons.check_circle,
              color: scribblrPrimaryColor,
            )
          : null,
    );
  }
}
