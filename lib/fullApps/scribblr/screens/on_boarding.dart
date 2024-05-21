import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/scribblr/screens/profile_setup/profile_walkthrough.dart';
import 'package:prokit_flutter/fullApps/scribblr/screens/auth/sign_in.dart';
import '../../../main.dart';
import '../components/custom_divider.dart';
import '../components/text_buttons.dart';
import '../utils/colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: appStore.isDarkModeOn ? scaffoldDarkColor : scribblrScaffoldPrimaryLight,
      statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark,
    ));
    return Observer(
      builder: (context) {
        return Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                45.height,
                Center(
                  child: Text(
                    "Let's you in",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
                  ),
                ),
                20.height,
                Container(
                  height: 54,
                  width: context.width(),
                  decoration: BoxDecoration(
                      color: appStore.isDarkModeOn ? Color(0xFF1F222A) : scaffoldLightColor,
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(36)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Ionicons.logo_google),
                      16.width,
                      Text(
                        'Continue with Google',
                        style: TextStyle(
                            color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
                      )
                    ],
                  ),
                ),
                16.height,
                Container(
                  height: 54,
                  width: context.width(),
                  decoration: BoxDecoration(
                      color: appStore.isDarkModeOn ? Color(0xFF1F222A) : scaffoldLightColor,
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(36)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Ionicons.logo_facebook),
                      16.width,
                      Text(
                        'Continue with Facebook',
                        style: TextStyle(
                            color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
                      )
                    ],
                  ),
                ),
                16.height,
                Container(
                  height: 54,
                  width: context.width(),
                  decoration: BoxDecoration(
                      color: appStore.isDarkModeOn ? Color(0xFF1F222A) : scaffoldLightColor,
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(36)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Ionicons.logo_apple),
                      16.width,
                      Text(
                        'Continue with Apple',
                        style: TextStyle(
                            color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
                      )
                    ],
                  ),
                ),
                10.height,
                Row(
                  children: [
                    CustomDivider(),
                    Text(
                      'OR',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
                    ),
                    CustomDivider(),
                  ],
                ),
                20.height,
                AppButtonLarge(
                    text: 'Sign in With Password',
                    onTap: () {
                      SignInScreen().launch(context);
                    }),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
                    ),
                    5.width,
                    TextButton(
                      onPressed: () {
                        ProfileWalkthroughScreen().launch(context);
                      },
                      child: Text('Sign up',
                          style: TextStyle(color: scribblrPrimaryColor, fontWeight: FontWeight.w600)),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
