import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/constant.dart';

import '../../../main.dart';
import '../screens/tab_bar_watermark_icon_screen.dart';
import '../screens/tab_bar_watermark_text_screen.dart';
import '../utils/common.dart';

Future<dynamic> AddWatermarkBottomSheetComponent(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                      color: appStore.isDarkModeOn ? proScanDarkPrimaryLightColor : Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(PRO_SCAN_DEFAULT_RADIUS),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 12),
                        Container(
                          height: 2,
                          width: 40,
                          decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS)),
                        ),
                        SizedBox(height: 16),
                        Text("Add Watermark", style: boldTextStyle(fontSize: 24)),
                        SizedBox(height: 16),
                        Divider(),
                        Expanded(
                          child: DefaultTabController(
                            length: 2,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              child: Scaffold(
                                backgroundColor: appStore.isDarkModeOn ? proScanDarkPrimaryLightColor : Colors.white,
                                appBar: TabBar(
                                  labelColor: proScanPrimaryColor,
                                  unselectedLabelColor: Colors.grey,
                                  indicatorColor: proScanPrimaryColor,
                                  labelStyle: primaryTextStyle(),
                                  tabs: [
                                    Tab(
                                      text: "Watermark Text",
                                    ),
                                    Tab(
                                      text: "Watermark Icon",
                                    ),
                                  ],
                                ),
                                body: TabBarView(
                                  children: [
                                    TabBarWatermarkTextScreen(),
                                    TabBarWatermarkIconScreen(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
      });
}
