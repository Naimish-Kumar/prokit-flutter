import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/common.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/constant.dart';

import '../../../main.dart';
import '../models/faq_model.dart';
import '../utils/images.dart';
import '../utils/lists.dart';

class FAQScreen extends StatefulWidget {
  FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  int selectedIndex = 0;
  bool isTapped = false;
  bool backgroundColor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 16),
          SizedBox(
            height: 40,
            child: ListView.builder(
              itemCount: faqScreenOptions.length,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return GestureDetector(
                  onTap: () {
                    selectedIndex = index;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: appStore.isDarkModeOn
                          ? selectedIndex == index
                              ? proScanPrimaryColor
                              : Colors.transparent
                          : selectedIndex == index
                              ? proScanPrimaryColor
                              : Colors.white,
                      border: Border.all(color: proScanPrimaryColor),
                      borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS),
                    ),
                    child: Text(
                      faqScreenOptions[index],
                      style: primaryTextStyle(color: selectedIndex == index ? Colors.white : proScanPrimaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      onTap: () {
                        backgroundColor = true;
                        setState(() {});
                      },
                      onFieldSubmitted: (value) {
                        backgroundColor = false;
                        setState(() {});
                      },
                      decoration: inputDecoration(
                        hintText: "Search",
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS), borderSide: BorderSide.none),
                        focusedBorder:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS), borderSide: BorderSide(color: proScanPrimaryColor)),
                        filled: true,
                        fillColor: appStore.isDarkModeOn
                            ? backgroundColor
                                ? Color(0xFF1c2031)
                                : proScanDarkPrimaryLightColor
                            : backgroundColor
                                ? proScanPrimaryLightColor
                                : Colors.grey.shade200,
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Image.asset(search_image, height: 20, width: 20, color: Colors.grey.shade500),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GestureDetector(
                            onTap: () {
                              //
                            },
                            child: Image.asset(filter_image, height: 20, color: proScanPrimaryColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: helpCenterQuestionList.length,
                    itemBuilder: (context, int index) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: appStore.isDarkModeOn ? Colors.white30 : Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Text(helpCenterQuestionList[index].title!,
                                        overflow: TextOverflow.visible, style: boldTextStyle(fontSize: 18))),
                                IconButton(
                                  splashRadius: 24,
                                  onPressed: () {
                                    helpCenterQuestionList[index].isTapped = !helpCenterQuestionList[index].isTapped!;
                                    setState(() {});
                                  },
                                  icon: helpCenterQuestionList[index].isTapped!
                                      ? Icon(Icons.arrow_drop_up_rounded, color: proScanPrimaryColor, size: 30)
                                      : Icon(Icons.arrow_drop_down_rounded, color: proScanPrimaryColor, size: 30),
                                ),
                              ],
                            ),
                            helpCenterQuestionList[index].isTapped!
                                ? Column(
                                    children: [
                                      Divider(),
                                      SizedBox(height: 8),
                                      Text(
                                        helpCenterQuestionList[index].description!,
                                        style: secondaryTextStyle(),
                                      ),
                                      SizedBox(height: 8)
                                    ],
                                  )
                                : Offstage(),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
