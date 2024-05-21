import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../components/text_styles.dart';
import '../utils/colors.dart';
import '../utils/images.dart';
import 'walkthrough_screen.dart';

class ScribblrSplashScreen extends StatefulWidget {
  static String tag = '/scribblr';

  const ScribblrSplashScreen({super.key});

  @override
  State<ScribblrSplashScreen> createState() => _ScribblrSplashScreenState();
}

class _ScribblrSplashScreenState extends State<ScribblrSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => WalkthroughScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: appStore.isDarkModeOn ? scaffoldDarkColor : scribblrScaffoldPrimaryLight,
      statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark,
    ));
    return Observer(builder: (context) {
      return Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset(app_logo, fit: BoxFit.cover, width: 100)),
              15.height,
              Center(
                child: Text('Scribblr',
                    style: primarytextStyle(
                        size: 20, color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
              ),
              15.height,
              Center(child: Lottie.asset(loader_lottie, width: 100, fit: BoxFit.cover)),
            ],
          ),
        ),
      );
    });
  }
}
