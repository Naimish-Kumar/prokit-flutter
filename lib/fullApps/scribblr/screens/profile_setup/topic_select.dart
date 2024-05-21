import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main.dart';
import '../../components/chips.dart';
import '../../components/text_styles.dart';
import '../../utils/constant.dart';

class SelectTopic extends StatefulWidget {
  const SelectTopic({super.key});

  @override
  State<SelectTopic> createState() => _SelectTopicState();
}

class _SelectTopicState extends State<SelectTopic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select your topic of \ninterest 🔖",
              style: primarytextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
            ),
            15.height,
            Text("Select topic of interest for better \nrecommendations, or you can skip it.", style: secondarytextStyle()),
            15.height,
            Wrap(
              spacing: 16,
              runSpacing: 4,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: labels.map((label) => CustomChips(label: label)).toList(),
            ),
            15.height,
          ],
        ),
      ),
    );
  }
}
