import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/constant.dart';

import '../../../main.dart';
import '../component/AppButton.dart';
import '../component/text_form_field_label_text.dart';
import '../utils/common.dart';
import '../utils/images.dart';
import 'bottom_navigation_bar_screen.dart';
import 'forgot_password_screen.dart';

class SignInWithPasswordScreen extends StatefulWidget {
  const SignInWithPasswordScreen({Key? key}) : super(key: key);

  @override
  State<SignInWithPasswordScreen> createState() => _SignInWithPasswordScreenState();
}

class _SignInWithPasswordScreenState extends State<SignInWithPasswordScreen> {
  bool obText = true;
  bool isChecked = false;
  late FocusNode f1;
  late FocusNode f2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    f1 = FocusNode();
    f2 = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    f1.dispose();
    f2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(elevation: 0, iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Hello there", style: boldTextStyle(fontSize: 24)),
                    SizedBox(width: 8),
                    Image.asset("images/proScan/images/hand.png", height: 30, width: 30),
                  ],
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Please enter your email and password to sign in.", style: secondaryTextStyle(color: appStore.isDarkModeOn ? proScanDarkTextSecondaryColor : Colors.black)),
                ),
                Column(
                  children: [
                    SizedBox(height: 24),
                    TextFormFieldLabelText(text: "Email"),
                    TextFormField(
                      focusNode: f1,
                      keyboardType: TextInputType.emailAddress,
                      decoration: inputDecoration(hintText: "Email"),
                      onFieldSubmitted: (value) {
                        f1.unfocus();
                        FocusScope.of(context).requestFocus(f2);
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormFieldLabelText(text: "Password"),
                    TextFormField(
                      focusNode: f2,
                      obscureText: obText,
                      decoration: inputDecoration(
                        hintText: "Password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            obText = !obText;
                            setState(() {});
                          },
                          child: Icon(obText ? Icons.visibility_off : Icons.visibility, color: proScanPrimaryColor),
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        f2.unfocus();
                      },
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
                SizedBox(height: 8),
                Divider(),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
                  },
                  child: Text(
                    "Forgot Password",
                    style: boldTextStyle(color: proScanPrimaryColor),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("or continue with", style: secondaryTextStyle()),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: appStore.isDarkModeOn ? Colors.white30 : Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS),
                          ),
                          child: Image.asset(sign_in_with_password_screen_google_image, height: height * 0.035),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                          decoration: BoxDecoration(border: Border.all(color: appStore.isDarkModeOn ? Colors.white30 : Colors.grey.shade300), borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS)),
                          child: Image.asset(sign_in_with_password_screen_apple_image, height: height * 0.035),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: appStore.isDarkModeOn ? Colors.white30 : Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS),
                          ),
                          child: Image.asset(sign_in_with_password_screen_facebook_image, height: height * 0.035),
                        ),
                      ),
                    ),
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
              text: "Sign in",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationBarScreen(itemIndex: 0)));
              },
            ),
          ),
        ],
      ),
    );
  }
}

// SizedBox(
//   height: 40,
//   width: width * 1,
//   child: ListView.builder(
//       primary: false,
//       scrollDirection: Axis.horizontal,
//       itemCount: signInOptionImage.length,
//       itemBuilder: (context, int index) {
//         return
//       }),
// )
