import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/screens/contact_us_screen.dart';
import 'package:prokit_flutter/fullApps/proScan/screens/faq_screen.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/common.dart';

import '../../../main.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Help Center", style: boldTextStyle(fontSize: 24)),
          elevation: 0,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          bottom: TabBar(
            labelColor: proScanPrimaryColor,
            labelStyle: boldTextStyle(fontSize: 18),
            unselectedLabelColor: Colors.grey,
            unselectedLabelStyle: primaryTextStyle(color: Colors.grey, fontSize: 16),
            indicatorColor: proScanPrimaryColor,
            indicator: UnderlineTabIndicator(borderSide: BorderSide(color: proScanPrimaryColor, width: 2)),
            tabs: [
              Tab(
                text: "FAQ",
              ),
              Tab(
                text: "Contact us",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [FAQScreen(), ContactUsScreen()],
        ),
      ),
    );
  }
}
