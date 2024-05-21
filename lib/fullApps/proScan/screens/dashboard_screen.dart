import 'dart:io';

import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prokit_flutter/fullApps/proScan/screens/recent_files_screen.dart';
import 'package:prokit_flutter/fullApps/proScan/screens/search_screen.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/common.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/constant.dart';

import '../../../main.dart';
import '../component/new_file_component.dart';
import '../component/recent_files_menu_options_bottom_sheet_component.dart';
import '../component/recent_files_share_bottom_sheet_component.dart';
import '../models/dashboard_model_class.dart';
import '../utils/images.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  bool obText = false;
  List<int> items = List.generate(dashboardIconsList.length, (index) => index);
  List<String> _pictures = [];
  File? image;
  File? _scannedImage;

  File? scannedDocument;

/*  openCameraImageScanner(BuildContext context) async {
    image = await DocumentScannerFlutter.launch(context,
        source: ScannerFileSource.CAMERA, labelsConfig: {ScannerLabelsConfig.ANDROID_NEXT_BUTTON_LABEL: "Next", ScannerLabelsConfig.ANDROID_SAVE_BUTTON_LABEL: "Save"});
    if (image != null) {
      _scannedImage = image;

      NewFileBottomSheet(context: context, scannedImage: _scannedImage!).then((_) => setState(() {}));
    }
  }*/

  void onPressed() async {
    List<String> pictures;
    try {
      pictures = await CunningDocumentScanner.getPictures(isGalleryImportAllowed: true) ?? [];
      if (!mounted) return;
      setState(() {
        _pictures = pictures;
        _scannedImage = File(pictures.first);
      });
      NewFileBottomSheet(context: context, scannedImage: _scannedImage!).then((_) => setState(() {}));
    } catch (exception) {
      // Handle exception here
    }
  }

  /*openImageScanner(BuildContext context) async {
    image = await DocumentScannerFlutter.launch(context,
        source: ScannerFileSource.GALLERY, labelsConfig: {ScannerLabelsConfig.ANDROID_NEXT_BUTTON_LABEL: "Next", ScannerLabelsConfig.ANDROID_OK_LABEL: "OK"});
    if (image != null) {
      _scannedImage = image;
      NewFileBottomSheet(context: context, scannedImage: _scannedImage!).then((_) => setState(() {}));
    }
  }*/

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool statusBarColor = false;

    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("ProScan"),
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
                icon: Image.asset(
                  search_image,
                  height: 26,
                  width: 26,
                  color: appStore.isDarkModeOn ? proScanDarkIconColor : proScanIconColor,
                ),
              ),
            ],
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 80),
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: 8,
                      runSpacing: 8,
                      children: items
                          .map(
                            (index) => Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    //
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(shape: BoxShape.circle, color: appStore.isDarkModeOn ? dashboardIconsList[index].darkImageColor : dashboardIconsList[index].color),
                                    child: Image.asset(dashboardIconsList[index].image.toString(), color: dashboardIconsList[index].imageColor, height: height * 0.06, width: width * 0.08),
                                  ),
                                ),
                                Text(dashboardIconsList[index].title.toString(),
                                    style: secondaryTextStyle(fontSize: 12, color: appStore.isDarkModeOn ? Colors.white : Colors.black), textAlign: TextAlign.center),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(height: 0),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Recent Files", style: boldTextStyle(fontSize: 18)),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => RecentFilesScreen()));
                              },
                              child: Icon(Icons.arrow_forward, color: proScanPrimaryColor)),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    ListView.builder(
                      itemCount: dashboardFilesList.length,
                      primary: false,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      itemBuilder: (context, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(color: appStore.isDarkModeOn ? proScanDarkPrimaryLightColor : Colors.grey.shade200, borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS)),
                          child: Row(
                            children: [
                              Container(
                                height: height * 0.13,
                                width: width * 0.23,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
                                child: (dashboardFilesList[index].image.toString().contains('images/proScan/images/'))
                                    ? Image.asset(
                                        dashboardFilesList[index].image.toString(),
                                        fit: BoxFit.fill,
                                      )
                                    : Image.file(
                                        File(dashboardFilesList[index].image!),
                                        fit: BoxFit.fill,
                                      ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dashboardFilesList[index].titleText.toString(),
                                      style: primaryTextStyle(),
                                      overflow: TextOverflow.fade,
                                    ),
                                    SizedBox(height: 16),
                                    Text("${dashboardFilesList[index].date}  ${dashboardFilesList[index].time}", style: secondaryTextStyle()),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  RecentFilesShareBottomSheetComponent(context, height);
                                  statusBarColor = !statusBarColor;
                                  setState(() {});
                                },
                                child: Icon(Icons.share_outlined, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                              ),
                              SizedBox(width: 8),
                              GestureDetector(
                                onTap: () {
                                  RecentFilesMenuOptionsBottomSheet(context, height, width, index,
                                      cardTitleText: dashboardFilesList[index].titleText,
                                      date: dashboardFilesList[index].date,
                                      time: dashboardFilesList[index].time,
                                      cardImage: dashboardFilesList[index].image);
                                },
                                child: Icon(
                                  Icons.more_vert,
                                  color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                                  size: 28,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 16,
                right: 86,
                child: GestureDetector(
                  onTap: () {
                    //openCameraImageScanner(context);
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
                    onPressed();
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: proScanPrimaryColor),
                    child: Image.asset(camera_image, color: Colors.white, height: 20, fit: BoxFit.fill),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
