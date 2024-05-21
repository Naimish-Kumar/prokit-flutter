import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/app_scaffold.dart';
import '../utils/colors.dart';
import '../utils/constant.dart';
import '../utils/images.dart';
import 'walk_through/walk_through_screen.dart';

class RelixSplashScreen extends StatefulWidget {
  static String tag = '/relix';

  @override
  _RelixSplashScreenState createState() => _RelixSplashScreenState();
}

class _RelixSplashScreenState extends State<RelixSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    afterBuildCreated(() async {
      setStatusBarColor(Colors.transparent, statusBarBrightness: Brightness.light, statusBarIconBrightness: Brightness.light);
    });

    await 3.seconds.delay;
    finish(context);
    WalkThroughScreen().launch(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        children: [
          Image.asset(app_logo, height: 100, width: 100).center(),
          Positioned(
            bottom: 200,
            left: 0,
            right: 0,
            child: SpinKitCircle(color: loaderColor, duration: Duration(seconds: 2)),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Text(APP_NAME, style: boldTextStyle(size: 30, color: whiteColor)).center(),
          ),
        ],
      ),
    );
  }
}
