import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/component/AppButton.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/common.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/constant.dart';

import '../../../main.dart';
import '../component/recent_files_menu_options_bottom_sheet_component.dart';
import '../component/recent_files_share_bottom_sheet_component.dart';
import '../models/dashboard_model_class.dart';

class MoveToFolderScreen extends StatelessWidget {
  const MoveToFolderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Move to Folder"),
        titleTextStyle: boldTextStyle(fontSize: 24),
        elevation: 0,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text("Total ${dashboardFilesList.length} files", style: boldTextStyle(fontSize: 18)),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      splashRadius: 24,
                      icon: Image.asset(
                        "images/proScan/images/up_down.png",
                        height: 18,
                        color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      splashRadius: 24,
                      icon: Image.asset(
                        "images/proScan/images/add_folder.png",
                        height: 22,
                        color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: dashboardFilesList.length,
                  padding: EdgeInsets.only(bottom: 80),
                  shrinkWrap: true,
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                      onLongPress: () {
                        //
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(color: appStore.isDarkModeOn ? proScanDarkPrimaryLightColor : Colors.grey.shade200, borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS)),
                        child: Row(
                          children: [
                            Container(
                              height: height * 0.13,
                              width: width * 0.23,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS),
                                image: DecorationImage(fit: BoxFit.fill, image: AssetImage(dashboardFilesList[index].image.toString())),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(dashboardFilesList[index].titleText.toString(), style: primaryTextStyle(), overflow: TextOverflow.fade),
                                  SizedBox(height: 16),
                                  Text("${dashboardFilesList[index].date}  ${dashboardFilesList[index].time}", style: secondaryTextStyle()),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                RecentFilesShareBottomSheetComponent(context, height);
                              },
                              child: Icon(
                                Icons.share_outlined,
                                color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                              ),
                            ),
                            SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {
                                RecentFilesMenuOptionsBottomSheet(context, height, width, index,
                                    cardTitleText: dashboardFilesList[index].titleText, date: dashboardFilesList[index].date, time: dashboardFilesList[index].time, cardImage: dashboardFilesList[index].image);
                              },
                              child: Icon(
                                Icons.more_vert,
                                color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                                size: 28,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: "Cancel",
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    color: appStore.isDarkModeOn ? proScanDarkPrimaryColor : proScanPrimaryLightColor,
                    textColor: appStore.isDarkModeOn ? Colors.white : proScanPrimaryColor,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: AppButton(
                    text: "Move Here",
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Folder is moved")));
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
