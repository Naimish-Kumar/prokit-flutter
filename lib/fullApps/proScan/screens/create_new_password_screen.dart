import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/constant.dart';

import '../../../main.dart';
import '../component/AppButton.dart';
import '../component/text_form_field_label_text.dart';
import '../utils/common.dart';
import '../utils/images.dart';
import 'bottom_navigation_bar_screen.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  bool obText = true;
  bool confirmObText = true;
  bool isChecked = false;

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
                  children: [Text("Create new password", style: boldTextStyle(fontSize: 24)), SizedBox(width: 8), Image.asset(create_new_password_screen_key_image, height: 30, width: 30)],
                ),
                SizedBox(height: 16),
                Text(
                  "Enter your new password, if you forgot it, then you have to do forgot password.",
                  style: secondaryTextStyle(color: appStore.isDarkModeOn ? proScanDarkTextSecondaryColor : Colors.black),
                ),
                SizedBox(height: 24),
                Column(
                  children: [
                    TextFormFieldLabelText(text: "Password"),
                    TextFormField(
                      obscureText: obText,
                      decoration: inputDecoration(
                        hintText: "Password",
                        suffixIcon: GestureDetector(
                            onTap: () {
                              obText = !obText;
                              setState(() {});
                            },
                            child: Icon(obText ? Icons.visibility_off : Icons.visibility, color: proScanPrimaryColor)),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormFieldLabelText(text: "Confirm Password"),
                    TextFormField(
                      obscureText: confirmObText,
                      decoration: inputDecoration(
                        hintText: "Confirm Password",
                        suffixIcon: GestureDetector(
                            onTap: () {
                              confirmObText = !confirmObText;
                              setState(() {});
                            },
                            child: Icon(confirmObText ? Icons.visibility_off : Icons.visibility, color: proScanPrimaryColor)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(
                      height: 16,
                      width: 16,
                      child: Checkbox(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS)),
                        activeColor: proScanPrimaryColor,
                        side: BorderSide(color: proScanPrimaryColor),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      "Remember me",
                      style: boldTextStyle(),
                    )
                  ],
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
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: appStore.isDarkModeOn ? proScanDarkPrimaryLightColor : Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS)),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 16),
                          CircleAvatar(
                            backgroundColor: proScanPrimaryColor,
                            minRadius: 30,
                            maxRadius: 55,
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Image.asset(create_new_password_screen_alert_dialog_person_image, color: Colors.white, fit: BoxFit.contain),
                            ),
                          ),
                          SizedBox(height: 24),
                          Text(
                            "Reset password Successful!",
                            textAlign: TextAlign.center,
                            style: boldTextStyle(color: proScanPrimaryColor, fontSize: 20),
                          ),
                          SizedBox(height: 16),
                          Text("Your password has been successfully changed.", style: secondaryTextStyle(), textAlign: TextAlign.center),
                          SizedBox(height: 24),
                          AppButton(
                            text: "Go to Home",
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationBarScreen(itemIndex: 0)));
                            },
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
