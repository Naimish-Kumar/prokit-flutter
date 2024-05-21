import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'walkthrough_screen/walkthrough_screen.dart';

class FvSplashScreen extends StatefulWidget {
  static String tag = '/muvi';
  @override
  State<FvSplashScreen> createState() => FvSplashScreenState();
}

class FvSplashScreenState extends State<FvSplashScreen> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => WalkthroughScreen().launch(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade800,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.movie_creation_rounded, size: 80, color: Colors.white),
            Text('Flix', style: TextStyle(fontSize: 48, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
