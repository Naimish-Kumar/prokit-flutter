import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:prokit_flutter/fullApps/proScan/screens/walkthrough_screen.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/common.dart';

import '../utils/images.dart';

class ProScanSplashScreen extends StatefulWidget {
  static String tag = '/pro_scan';

  ProScanSplashScreen({Key? key}) : super(key: key);

  @override
  State<ProScanSplashScreen> createState() => _ProScanSplashScreenState();
}

class _ProScanSplashScreenState extends State<ProScanSplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => WalkthroughScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(splash_screen_image, color: proScanPrimaryColor, height: height * 0.3, width: width * 0.40),
                  Text("ProScan", style: boldTextStyle(fontSize: 30)),
                ],
              )),
          Positioned(
            height: height * 0.1,
            width: width * 1,
            bottom: 80,
            child: SpinKitCircle(
              color: proScanPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
