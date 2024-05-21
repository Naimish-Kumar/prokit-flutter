import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme15/components/elevatedbutton_component.dart';
import 'package:prokit_flutter/themes/theme15/components/login_textfield_component.dart';
import 'package:prokit_flutter/themes/theme15/components/password_textfield_component.dart';

import '../utils/T15colors.dart';

class T15SignUpScreen extends StatefulWidget {
  const T15SignUpScreen({Key? key}) : super(key: key);

  @override
  State<T15SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<T15SignUpScreen> {
  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //removed sizedBox()
    //Added double.height
    //Row was wrapped under Padding => removed padding => added  mainAxisSize: MainAxisSize.min,
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            80.height,
            Container(
              padding: EdgeInsets.all(8),
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: secondarycolor, borderRadius: BorderRadius.circular(30)),
              child: Image.asset(
                "images/theme15/pets_images/dog9.png",
                height: 80,
                width: 80,
              ),
            ),
            32.height,
            Text("Sign Up", style: boldTextStyle(size: 24)),
            14.height,
            Text("Enter Your Credentials To Continue", style: secondaryTextStyle(size: 18)),
            32.height,
            LoginTextfieldComponent(
              icon: Icon(Icons.person_outline_rounded, size: 30, color: Colors.grey),
              nextFocus: emailFocus,
              focus: nameFocus,
              hint_text: "Name",
            ),
            16.height,
            LoginTextfieldComponent(
              focus: emailFocus,
              nextFocus: passwordFocus,
              icon: Icon(
                Icons.email_outlined,
                size: 30,
                color: Colors.grey,
              ),
              hint_text: "Email or username",
            ),
            16.height,
            PasswordTextfieldComponent(focus: passwordFocus),
            22.height,
            ElevatedButtonComponent(text: "Sign Up", toastText: 'Welcome!').paddingSymmetric(horizontal: 16),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Already have an account?",
                    style: primaryTextStyle(size: 14),
                    children: [
                      TextSpan(text: " Sign In", style: primaryTextStyle(color: primarycolor)),
                    ],
                  ),
                ),
                Image.asset("images/theme15/icons/play.png", color: primarycolor, height: 15, width: 10)
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 36, top: 32),
              child: Image.asset("images/theme15/signin_screen_image.png", height: 200),
            ),
          ],
        ),
      ),
    );
  }
}
