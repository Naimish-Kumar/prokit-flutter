import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/workingApps/chatGPTMailGeneration/screens/email_generator_screen.dart';
import 'package:prokit_flutter/workingApps/chatGPTMailGeneration/utils/images.dart';

import '../../../main/utils/AppColors.dart';

class ChatGPTSplashScreen extends StatefulWidget {
  static String tag = '/smartemail';

  @override
  _ChatGPTSplashScreenState createState() => _ChatGPTSplashScreenState();
}

class _ChatGPTSplashScreenState extends State<ChatGPTSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    afterBuildCreated(() {
      setStatusBarColor(appStore.isDarkModeOn ? context.scaffoldBackgroundColor : appColorPrimary, statusBarIconBrightness: Brightness.light);
    });

    await 500.milliseconds.delay;

    finish(context);
    EmailGeneratorScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.height(),
        width: context.width(),
        color: appStore.isDarkModeOn ? null : appColorPrimary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ic_mail, height: 150, width: 150, color: Colors.white),
            Text('Smart Email Generator', style: boldTextStyle(size: 24, color: Colors.white, fontFamily: GoogleFonts.actor().fontFamily)),
          ],
        ),
      ),
    );
  }
}
