import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../screens/auth/sign_in.dart';
import '../screens/settings_screen/about_us.dart';
import '../screens/settings_screen/help_center.dart';
import '../screens/settings_screen/invite_friends.dart';
import '../screens/settings_screen/language.dart';
import '../screens/settings_screen/notification.dart';
import '../screens/settings_screen/personal_info.dart';
import '../screens/settings_screen/security.dart';
import '../utils/colors.dart';
import 'text_styles.dart';

class SettingsComponent extends StatefulWidget {
  final IconData icon;
  final Color? color;
  final String text;
  final bool showSwitch;
  final Widget? screen;

  final void Function(BuildContext)? onTap;

  SettingsComponent({
    required this.icon,
    required this.text,
    this.color,
    this.onTap,
    this.showSwitch = false,
    this.screen,
  });

  @override
  State<SettingsComponent> createState() => _SettingsComponentState();
}

class _SettingsComponentState extends State<SettingsComponent> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return GestureDetector(
        onTap: () => widget.onTap!(context),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: skipbutton),
                  child: Icon(widget.icon, color: widget.color),
                ),
                16.width,
                Text(
                  widget.text,
                  style: secondarytextStyle(
                      color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                ).expand(),
                if (widget.showSwitch)
                  Switch(
                    activeTrackColor: scribblrPrimaryColor,
                    inactiveTrackColor: context.scaffoldBackgroundColor,
                    activeColor: Colors.white,
                    value: appStore.isDarkModeOn,
                    onChanged: (value) {
                      appStore.toggleDarkMode(value: value);
                    },
                  ).onTap(() {
                    if (widget.screen != null) {
                      widget.screen!.launch(context);
                    }
                  }),
              ],
            ),
            10.height,
          ],
        ),
      );
    });
  }
}

List<Widget> settingComponent(BuildContext context) => [
      SettingsComponent(
          icon: Icons.person,
          color: Colors.red,
          text: 'Personal Info',
          onTap: (context) {
            PersonalInfo().launch(context);
          }),
      SettingsComponent(
          icon: Icons.notifications,
          color: Colors.orange,
          text: 'Notification',
          onTap: (context) {
            NotificationSettings().launch(context);
          }),
      SettingsComponent(
          icon: Icons.security,
          color: Colors.green,
          text: 'Security',
          onTap: (context) {
            SecuritySettings().launch(context);
          }),
      SettingsComponent(
          icon: Icons.language,
          color: Colors.blueAccent,
          text: 'Language',
          onTap: (context) {
            LanguageSettings().launch(context);
          }),
      SettingsComponent(
          icon: appStore.isDarkModeOn ? Icons.dark_mode_outlined : Icons.dark_mode,
          color: Colors.black,
          text: 'Dark Mode',
          showSwitch: true),
      SettingsComponent(
          icon: Icons.people,
          color: Colors.orangeAccent,
          text: 'Invite Friends',
          onTap: (context) {
            InviteFriends().launch(context);
          }),
      SettingsComponent(
          icon: Icons.article_outlined,
          color: Colors.lightGreen,
          text: 'Help Center',
          onTap: (context) {
            HelpCenter().launch(context);
          }),
      SettingsComponent(
          icon: Icons.info,
          color: scribblrPrimaryColor,
          text: 'About Scribblr',
          onTap: (context) {
            AboutUs().launch(context);
          }),
      SettingsComponent(
          icon: Icons.logout_rounded,
          color: Colors.red,
          text: 'Logout',
          onTap: (context) {
            SignInScreen().launch(context);
          }),
    ];
