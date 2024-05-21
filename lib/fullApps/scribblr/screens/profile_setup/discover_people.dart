import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main.dart';
import '../../components/invite_user_component.dart';
import '../../components/text_styles.dart';
import '../../models/invite_user_model.dart';

class DiscoverPeople extends StatefulWidget {
  const DiscoverPeople({super.key});

  @override
  State<DiscoverPeople> createState() => _DiscoverPeopleState();
}

class _DiscoverPeopleState extends State<DiscoverPeople> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Discover People 🌏',
              style: primarytextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
            ),
            15.height,
            Text('Pick some people to follow.', style: secondarytextStyle()),
            15.height,
            ...List.generate(
              getInviteUserModelList().length,
              (index) => InviteUserComponent(userModelData: getInviteUserModelList()[index], selectedText: 'Following', unselectedText: 'Follow').paddingSymmetric(vertical: 2),
            ),
          ],
        ),
      ),
    );
  }
}
