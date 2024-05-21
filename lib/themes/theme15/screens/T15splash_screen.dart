import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/T15colors.dart';

class T15SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: context.height() * 0.86,
            width: context.width(),
            decoration:
                BoxDecoration(color: primarycolor, borderRadius: BorderRadius.vertical(bottom: Radius.circular(200))),
            child: Column(
              children: [
                SizedBox(height: 100),
                Text("Get Pet", style: boldTextStyle(size: 52, color: white, weight: FontWeight.w900)),
                12.height,
                Text("Tack Care of your\n adopt pet",
                    style: secondaryTextStyle(color: Colors.white60, size: 16), textAlign: TextAlign.center),
                6.height,
                Image.asset("images/theme15/splash_screen_image.png", fit: BoxFit.cover, height: 350),
                32.height,
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 18),
            child: LinearProgressIndicator(value: 0.7, backgroundColor: Colors.white, color: primarycolor),
          ),
          Text("Version 1.0", style: boldTextStyle(color: primarycolor))
        ],
      ),
    );
  }
}
