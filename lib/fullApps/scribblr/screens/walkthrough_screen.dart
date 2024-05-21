import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../models/walkthrough_model.dart';
import '../utils/colors.dart';
import 'on_boarding.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: appStore.isDarkModeOn ? Color(0xFF181A20) : Colors.white,
      statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark,
    ));
    int totalPageCount = 2;
    return Observer(builder: (context) {
      return Scaffold(
        backgroundColor: appStore.isDarkModeOn ? Color(0xFF181A20) : Colors.white,
        body: Stack(
          children: [
            PageView.builder(
                controller: _pageController,
                itemCount: walkthroughList.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  WalkModel data = walkthroughList[i];

                  return Observer(builder: (context) {
                    return buildPage(
                      data.imagePath,
                      data.title,
                      data.subtitle,
                    );
                  });
                }),
            buildDotIndicator(),
          ],
        ),
        bottomNavigationBar: Observer(
          builder: (_) => _currentIndex == totalPageCount
              ? Padding(
                  padding: EdgeInsets.all(16.0),
                  child: AppButton(
                    elevation: 0,
                    onTap: () {
                      OnBoardingScreen().launch(context);
                    },
                    color: scribblrPrimaryColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    child: Text('Get Started',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white)),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppButton(
                      elevation: 0,
                      onTap: () {
                        OnBoardingScreen().launch(context);
                      },
                      color: appStore.isDarkModeOn ? Color(0xFF1F222A) : skipbutton,
                      shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      child: Text('Skip',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: appStore.isDarkModeOn ? Colors.white : scribblrPrimaryColor)),
                    ).expand(),
                    16.width,
                    AppButton(
                      elevation: 0,
                      onTap: () {
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                      },
                      color: scribblrPrimaryColor,
                      shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      child: Text('Next',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white)),
                    ).expand(),
                  ],
                ).paddingAll(16),
        ),
      );
    });
  }

  Positioned buildDotIndicator() {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: DotIndicator(
        pageController: _pageController,
        pages: walkthroughList,
        indicatorColor: scribblrPrimaryColor,
        unselectedIndicatorColor: Color(0xFF35383E),
        currentBoxShape: BoxShape.rectangle,
        currentDotSize: 40,
        borderRadius: BorderRadius.circular(20),
        currentDotWidth: 20,
        currentBorderRadius: BorderRadius.circular(20),
        boxShape: BoxShape.rectangle,
        dotSize: 7,
      ),
    );
  }

  Widget buildPage(String Function() imagePath, String title, String subtitle) {
    return Observer(
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imagePath()), fit: BoxFit.cover)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: (MediaQuery.of(context).size.height * 0.25) - 80,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        title,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                      ),
                      16.height,
                      Text(
                        textAlign: TextAlign.center,
                        subtitle,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
