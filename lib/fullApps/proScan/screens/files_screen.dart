import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/screens/search_screen.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/constant.dart';

import '../../../main.dart';
import '../component/folder_bottom_sheet_component.dart';
import '../component/new_folder_bottom_sheet_component.dart';
import '../component/recent_files_menu_options_bottom_sheet_component.dart';
import '../component/recent_files_share_bottom_sheet_component.dart';
import '../models/dashboard_model_class.dart';
import '../utils/common.dart';
import '../utils/images.dart';

class FilesScreen extends StatefulWidget {
  const FilesScreen({Key? key}) : super(key: key);

  @override
  State<FilesScreen> createState() => _FilesScreenState();
}

class _FilesScreenState extends State<FilesScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Files"),
        titleTextStyle: boldTextStyle(fontSize: 24),
        elevation: 0,
        titleSpacing: 0,
        leading: Padding(
          padding: EdgeInsets.all(12.0),
          child: Image.asset(splash_screen_image, color: proScanPrimaryColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
            },
            splashRadius: 22,
            icon: Image.asset(search_image, height: 26, width: 26, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          ),
          IconButton(
            onPressed: () {},
            splashRadius: 22,
            icon: Image.asset(more_image, height: 26, width: 26, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text("Total ${recentFilesList.length} files", style: boldTextStyle(fontSize: 18)),
                  ),
                  Spacer(),
                  PopupMenuButton(
                    icon: Image.asset(page_up_down_image, height: 18, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS)),
                    onSelected: (value) {},
                    color: appStore.isDarkModeOn ? proScanDarkPrimaryLightColor : Colors.white,
                    splashRadius: 24,
                    itemBuilder: (context) => [
                      popupItem(title: "Title (A to Z)", value: 1),
                      popupItem(title: "Title (Z to A)", value: 2),
                      popupItem(title: "Date Created", value: 3),
                      popupItem(title: "Date Modified", value: 4),
                      popupItem(title: "Date Last Opened", value: 5),
                      popupItem(title: "Date Added", value: 6),
                      popupItem(title: "Size", value: 7),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        NewFolderBottomSheetComponent(context).then((_) => setState(() {}));
                      },
                      splashRadius: 24,
                      icon: Image.asset(folder_image, height: 22, color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: recentFilesList.length,
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
                        decoration: BoxDecoration(
                          color: appStore.isDarkModeOn ? proScanDarkPrimaryLightColor : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: height * 0.13,
                              width: width * 0.23,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS),
                                image: DecorationImage(fit: BoxFit.fill, image: AssetImage(recentFilesList[index].image.toString())),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    recentFilesList[index].titleText.toString(),
                                    style: primaryTextStyle(),
                                    overflow: TextOverflow.fade,
                                  ),
                                  SizedBox(height: 8),
                                  if (recentFilesList[index].folderText!.isNotEmpty)
                                    Row(
                                      children: [
                                        Image.asset(document_image, color: Colors.grey, height: 15, width: 15),
                                        SizedBox(width: 8),
                                        Text(" 0 files", style: secondaryTextStyle()),
                                      ],
                                    ),
                                  SizedBox(height: 8),
                                  Text("${recentFilesList[index].date}  ${recentFilesList[index].time}", style: secondaryTextStyle()),
                                ],
                              ),
                            ),
                            if (recentFilesList[index].folderText!.isEmpty)
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
                                if (recentFilesList[index].folderText!.isEmpty) {
                                  RecentFilesMenuOptionsBottomSheet(
                                    context,
                                    height,
                                    width,
                                    index,
                                    cardTitleText: recentFilesList[index].titleText,
                                    date: recentFilesList[index].date,
                                    time: recentFilesList[index].time,
                                    cardImage: recentFilesList[index].image,
                                  );
                                } else {
                                  FolderBottomSheetComponent(context, height, width,
                                          cardImage: recentFilesList[index].image,
                                          time: recentFilesList[index].time,
                                          date: recentFilesList[index].date,
                                          fileText: recentFilesList[index].folderText,
                                          cardTitleText: recentFilesList[index].titleText,
                                          listIndex: index)
                                      .then((value) => setState(() {}));
                                }
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
            right: 86,
            child: GestureDetector(
              onTap: () {
                //
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(shape: BoxShape.circle, color: proScanPrimaryColor),
                child: Image.asset(camera_image, color: Colors.white, height: 20, fit: BoxFit.fill),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: GestureDetector(
              onTap: () {
                //
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(shape: BoxShape.circle, color: proScanPrimaryColor),
                child: Image.asset(picture_image, color: Colors.white, height: 20, fit: BoxFit.fill),
              ),
            ),
          )
        ],
      ),
    );
  }

  PopupMenuItem<int> popupItem({required String title, required int value}) {
    return PopupMenuItem(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(title, style: primaryTextStyle(fontSize: 14)), Divider()],
      ),
      value: value,
    );
  }
}
