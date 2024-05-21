import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main.dart';
import '../../components/settings_notification_switch.dart';
import '../../components/text_styles.dart';
import '../../utils/colors.dart';
import '../auth/forgot_password.dart';

class SecuritySettings extends StatefulWidget {
  const SecuritySettings({super.key});

  @override
  State<SecuritySettings> createState() => _SecuritySettingsState();
}

class _SecuritySettingsState extends State<SecuritySettings> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          surfaceTintColor: context.scaffoldBackgroundColor,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          title: Text(
            'Security',
            style: primarytextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          ),
          backgroundColor: context.scaffoldBackgroundColor,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...securityScreen,
              15.height,
              Center(
                child: AppButton(
                  onTap: () {
                    ForgotPasswordScreen().launch(context);
                  },
                  elevation: 0,
                  child: Text(
                    'Reset Password',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: indicatorColor),
                  ),
                  color: appStore.isDarkModeOn ? Color(0xFF1F222A) : skipbutton,
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
