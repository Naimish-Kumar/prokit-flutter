import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../main.dart';
import '../../utils/colors.dart';


import '../../components/text_styles.dart';
import '../../utils/images.dart';
import '../create_article.dart';
import '../fragments/discover_fragment.dart';
import '../fragments/home_fragment.dart';
import '../fragments/my_articles_fragment.dart';
import '../fragments/profile_fragment.dart';
import 'notification_screen.dart';
import 'settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentPageIndex = 0;

  List<String> title = ['Scribblr', 'Discover', 'Create', 'My Articles', 'Profile'];
  List<Widget> screens = [
    HomeFragment(),
    DiscoverFragment(),
    CreateArticleScreen(),
    MyArticlesFragment(),
    ProfileFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          surfaceTintColor: context.scaffoldBackgroundColor,
          backgroundColor: context.scaffoldBackgroundColor,
          elevation: 0,
          title: Text(
            title[currentPageIndex],
            style: primarytextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
          ),
          leading: Image.asset(app_icon),
          actions: [
            if (currentPageIndex == 0)
              SvgPicture.asset(notification_icon, color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor, width: 22, height: 22).onTap(() {
                NotificationScreen().launch(context);
              }),
            if (currentPageIndex == 2)
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: scribblrPrimaryColor,
                    elevation: 0,
                  ),
                  child: Text(
                    'Publish',
                    style: TextStyle(color: Colors.white),
                  )),
            if (currentPageIndex == 1 || currentPageIndex == 3) Image.asset(search_icon, color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor, width: 28, height: 28).onTap(() {}),
            if (currentPageIndex == 4)
              SvgPicture.asset(settings_icon, color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor, width: 22, height: 22).onTap(() {
                SettingsScreen().launch(context);
              }),
            16.width,
          ],
        ),
        body: screens[currentPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: currentPageIndex,
          onTap: (int index) {
            setState(() {
              currentPageIndex = index;
            });
            log(screens[currentPageIndex]);
          },
          unselectedItemColor: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor,
          selectedItemColor: scribblrPrimaryColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          iconSize: 24,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Ionicons.home_outline,
                color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor,
              ),
              activeIcon: Icon(Ionicons.home, color: scribblrPrimaryColor),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Ionicons.compass_outline,
                color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor,
              ),
              activeIcon: Icon(Ionicons.compass, color: scribblrPrimaryColor),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Ionicons.add_circle,
                size: 32,
                color: scribblrPrimaryColor,
              ),
              activeIcon: Icon(Ionicons.add_circle, color: scribblrPrimaryColor),
              label: 'Create',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Ionicons.newspaper_outline,
                color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor,
              ),
              activeIcon: Icon(Ionicons.newspaper, color: scribblrPrimaryColor),
              label: 'My Articles',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Ionicons.person_outline,
                color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor,
              ),
              activeIcon: Icon(Ionicons.person, color: scribblrPrimaryColor),
              label: 'Profile',
            ),
          ],
        ),
      );
    });
  }
}
