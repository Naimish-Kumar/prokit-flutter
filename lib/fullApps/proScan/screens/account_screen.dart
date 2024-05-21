import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prokit_flutter/fullApps/proScan/screens/bottom_navigation_bar_screen.dart';
import 'package:prokit_flutter/fullApps/proScan/screens/sign_up_screen.dart';
import 'package:prokit_flutter/main.dart';

import '../component/logout_component.dart';
import '../models/account_screen_model.dart';
import '../utils/color.dart';
import '../utils/common.dart';
import '../utils/constant.dart';
import '../utils/images.dart';
import '../utils/lists.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Account"),
            titleTextStyle: boldTextStyle(fontSize: 24),
            elevation: 0,
            titleSpacing: 0,
            leading: Padding(
              padding: EdgeInsets.all(12.0),
              child: Image.asset(splash_screen_image, color: proScanPrimaryColor),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                splashRadius: 22,
                icon: Image.asset(more_image, height: 26, width: 26, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: appStore.isDarkModeOn ? proScanDarkPrimaryLightColor : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS),
                    border: Border.all(color: appStore.isDarkModeOn ? Colors.white24 : Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                            image: image == null ? Image.asset(sign_up_screen_person_image, color: Colors.grey, fit: BoxFit.contain).image : Image.file(File(image!.path), fit: BoxFit.cover).image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              nameCont.text.length == 0
                                  ? Text(
                                      "User Name",
                                      style: boldTextStyle(),
                                    )
                                  : Text(
                                      nameCont.text,
                                      style: boldTextStyle(),
                                    ),
                              SizedBox(width: 16),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: proScanPrimaryColor),
                                ),
                                child: Text(
                                  "Basic",
                                  style: secondaryTextStyle(color: proScanPrimaryColor, fontSize: 10),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text("0 MB / 1024 MB", style: secondaryTextStyle()),
                          SizedBox(height: 8),
                          Container(
                            height: 8,
                            width: width * 0.5,
                            decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS)),
                            child: Row(
                              children: [
                                Container(
                                  width: width * 0.03,
                                  height: 8,
                                  decoration: BoxDecoration(color: proScanPrimaryColor, borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS),
                    gradient: LinearGradient(colors: [Color(0xFF667fff), Color(0xFF4c69ff)], stops: [0.1, 0.9]),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(color: Color(0xFFfb9f19), shape: BoxShape.circle),
                        child: Image.asset(
                          star_image,
                          height: height * 0.05,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Go to Premium!", style: boldTextStyle(fontSize: 18, color: Colors.white)),
                          SizedBox(height: 8),
                          Text("Enjoy all the benefits", style: secondaryTextStyle(color: Colors.white)),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavigationBarScreen(
                                        itemIndex: 2,
                                      )));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS),
                          ),
                          child: Text(
                            "Upgrade",
                            style: primaryTextStyle(color: proScanPrimaryColor, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                ListView.builder(
                  itemCount: accountOptions.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, int index) {
                    return InkWell(
                      onTap: () {
                        if (index == accountOptions.length - 1) {
                          return null;
                        } else {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => accountScreenInfoRouteList[index]));
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, right: 8),
                        child: Row(
                          children: [
                            Image.asset(accountOptions[index].image ?? "", height: 20, width: 20, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                            SizedBox(width: 16),
                            Text(accountOptions[index].title ?? "", style: primaryTextStyle()),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  accountOptions[index].trailingText ?? "",
                                  style: primaryTextStyle(),
                                ),
                                index == accountOptions.length - 1
                                    ? Observer(
                                        builder: (context) {
                                          return Switch(
                                            value: appStore.isDarkModeOn,
                                            activeTrackColor: proScanPrimaryColor,
                                            activeColor: Colors.white,
                                            onChanged: (value) {
                                              appStore.toggleDarkMode(value: value);
                                              // mode.isDarkMode(value); //TODO: check dark mode
                                            },
                                          );
                                        },
                                      )
                                    : IconButton(
                                        onPressed: () {
                                          if (index == 4) {
                                            return null;
                                          } else {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => accountScreenInfoRouteList[index]));
                                          }
                                        },
                                        splashRadius: 28,
                                        icon: Icon(Icons.arrow_forward_ios, size: 20),
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Divider(),
                ListView.builder(
                  itemCount: aboutAppOptions.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, int index) {
                    return InkWell(
                      onTap: () {
                        if (index == 2) {
                          LogoutBottomSheet(context);
                        } else {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => accountScreenHelpRoutList[index]));
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, right: 8),
                        child: Row(
                          children: [
                            index == 2
                                ? Image.asset(aboutAppOptions[index].image ?? "", height: 20, width: 20, color: Colors.redAccent)
                                : Image.asset(aboutAppOptions[index].image ?? "", height: 20, width: 20, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                            SizedBox(width: 16),
                            index == 2 ? Text(aboutAppOptions[index].title ?? "", style: primaryTextStyle(color: Colors.redAccent)) : Text(aboutAppOptions[index].title ?? "", style: primaryTextStyle()),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  aboutAppOptions[index].trailingText ?? "",
                                  style: primaryTextStyle(),
                                ),
                                index == 2
                                    ? IconButton(
                                        onPressed: () {},
                                        splashRadius: 1,
                                        icon: Icon(Icons.arrow_forward_ios, size: 0),
                                      )
                                    : IconButton(
                                        onPressed: () {
                                          if (index == 2) {
                                            LogoutBottomSheet(context);
                                          } else {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => accountScreenHelpRoutList[index]));
                                          }
                                        },
                                        splashRadius: 28,
                                        icon: Icon(Icons.arrow_forward_ios, size: 20),
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
