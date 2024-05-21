import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../components/app_scaffold.dart';
import '../../components/common_app_button.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../auth/register_screen.dart';
import 'model/walk_through_model.dart';

class WalkThroughScreen extends StatefulWidget {
  @override
  _WalkThroughScreenState createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  PageController pageController = PageController(initialPage: 0);

  List<WalkThroughModel> pages = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    afterBuildCreated(() async {
      setStatusBarColor(Colors.transparent, statusBarBrightness: Brightness.light, statusBarIconBrightness: Brightness.light);
    });

    pages.add(WalkThroughModel(title: 'Happy Music!', subTitle: 'Save your favorites to your playlist, and just start singing', img: walk_img_1));
    pages.add(WalkThroughModel(title: 'Sing alone', subTitle: 'Translate lyrics in different languages and sing along', img: walk_img_2));
    pages.add(WalkThroughModel(title: 'Search A Song', subTitle: 'Find a songs just by singing it’s rhythm or lyrics', img: walk_img_3));
    pages.add(WalkThroughModel(title: 'Listen to the best music everyday with Relix now!', img: walk_img_4));
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            itemCount: pages.length,
            onPageChanged: (index) {
              currentIndex = index + 1;
              setState(() {});
            },
            itemBuilder: (context, index) {
              WalkThroughModel page = pages[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  100.height,
                  Image.asset(page.img.validate(), height: context.height() * 0.4, width: context.width()),
                  60.height,
                  Text(page.title.validate(), style: boldTextStyle(size: 24, color: whiteColor), textAlign: TextAlign.center).paddingSymmetric(horizontal: 60),
                  16.height,
                  if (currentIndex != 4) Text(page.subTitle.validate(), style: secondaryTextStyle(), textAlign: TextAlign.center, maxLines: 2).paddingSymmetric(horizontal: 60),
                ],
              );
            },
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: DotIndicator(
              pageController: pageController,
              pages: pages,
              indicatorColor: lightGray,
              unselectedIndicatorColor: Colors.white70,
              currentBoxShape: BoxShape.rectangle,
              currentBorderRadius: radius(),
              boxShape: BoxShape.rectangle,
              borderRadius: radius(),
              currentDotSize: 26,
              currentDotWidth: 6,
              dotSize: 8,
            ),
          ),
          Positioned(
            bottom: currentIndex != 4 ? 0 : 30,
            left: currentIndex == 4 ? 10 : null,
            right: currentIndex == 4 ? 10 : null,
            child: currentIndex != 4
                ? Container(
                    width: context.width(),
                    padding: EdgeInsets.all(20),
                    decoration: boxDecorationDefault(borderRadius: radius(0), color: lightPurple, boxShadow: defaultBoxShadow(spreadRadius: 0, blurRadius: 0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Skip', style: secondaryTextStyle(size: 16)).onTap(() {
                          RegisterScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                        }),
                        Text('Next', style: primaryTextStyle(color: whiteColor)).onTap(() {
                          pageController.nextPage(duration: 500.milliseconds, curve: Curves.linearToEaseOut);
                        }),
                      ],
                    ),
                  )
                : CommonAppButton(
                    btnText: 'Get Started',
                    onPressed: () {
                      RegisterScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                    },
                  ).paddingSymmetric(horizontal: 16),
          ),
        ],
      ),
    );
  }
}
