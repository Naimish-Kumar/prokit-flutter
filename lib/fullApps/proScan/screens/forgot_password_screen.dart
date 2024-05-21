import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/screens/otp_screen.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';

import '../../../main.dart';
import '../component/AppButton.dart';
import '../component/text_form_field_label_text.dart';
import '../utils/common.dart';
import '../utils/images.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [Text("Forgot Password", style: boldTextStyle(fontSize: 24)), Image.asset(forgot_password_screen_image, height: 30, width: 30)],
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Enter your email address,We will send an OTP code for verification in the next step.",
                    style: secondaryTextStyle(color: appStore.isDarkModeOn ? proScanDarkTextSecondaryColor : Colors.black),
                  ),
                ),
                SizedBox(height: 24),
                TextFormFieldLabelText(text: "Email"),
                TextFormField(
                  decoration: inputDecoration(hintText: "Email"),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: AppButton(
              text: "Continue",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
