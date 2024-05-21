import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/component/rename_bottom_sheet_component.dart';
import 'package:prokit_flutter/fullApps/proScan/screens/merge_pdf_screen.dart';
import 'package:prokit_flutter/fullApps/proScan/screens/protect_pdf_screen.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/constant.dart';

import '../../../main.dart';
import '../models/dashboard_model_class.dart';
import '../screens/add_digital_signature_screen.dart';
import '../screens/compress_pdf_screen.dart';
import '../screens/export_to_screen.dart';
import '../screens/move_to_folder_screen.dart';
import '../utils/common.dart';
import 'add_watermark_bottom_sheet_component.dart';
import 'delete_file_bottom_sheet_component.dart';

Future<dynamic> RecentFilesMenuOptionsBottomSheet(BuildContext context, double height, double width, int listIndex, {String? cardTitleText, String? date, String? time, String? cardImage}) {
  return showModalBottomSheet(
    backgroundColor: appStore.isDarkModeOn ? proScanDarkPrimaryLightColor : Colors.white,
    enableDrag: true,
    isScrollControlled: true,
    shape: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.vertical(top: Radius.circular(PRO_SCAN_DEFAULT_RADIUS))),
    context: context,
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.65,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            // padding: EdgeInsets.symmetric(horizontal: 16),
            controller: scrollController,
            child: SizedBox(
              height: height * 1.42,
              child: Column(
                children: [
                  SizedBox(height: 12),
                  Container(
                    height: 2,
                    width: 40,
                    decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS)),
                  ),
                  SizedBox(height: 16),

                  ///container
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(color: appStore.isDarkModeOn ? proScanDarkPrimaryColor : Colors.grey.shade200, borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS)),
                    child: Row(
                      children: [
                        Container(
                          height: height * 0.13,
                          width: width * 0.23,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS),
                            image: DecorationImage(fit: BoxFit.fill, image: AssetImage(cardImage!)),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cardTitleText!, style: primaryTextStyle(), overflow: TextOverflow.fade),
                              SizedBox(height: 16),
                              Text("${date} ${time}", style: secondaryTextStyle()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Divider(),

                  /// two listTiles
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("File is saved")));
                    },
                    child: ListTile(
                      title: RichText(
                        text: TextSpan(text: "Save to Device", style: primaryTextStyle()),
                      ),
                      leading: Image.asset(
                        "images/proScan/icons/dashboard_icons/save.png",
                        height: 20,
                        color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                        color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExportToScreen(export_to_text: cardTitleText),
                        ),
                      );
                    },
                    child: ListTile(
                      title: RichText(
                        text: TextSpan(text: "Export to ...", style: primaryTextStyle()),
                      ),
                      leading: Image.asset(
                        "images/proScan/icons/dashboard_icons/export.png",
                        height: 20,
                        color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                        color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 336,
                    child: ListView.builder(
                      itemCount: recentFilesMenuOptionsList.length,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 16),
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (context, int index) {
                        return GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              Navigator.pop(context);
                              AddWatermarkBottomSheetComponent(context);
                            } else if (index == 1) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AddDigitalSignatureScreen()));
                            } else if (index == 3) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MergePdfScreen()));
                            } else if (index == 4) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProtectPdfScreen()));
                            } else if (index == 5) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CompressPdfScreen(
                                    cardTitleText: cardTitleText,
                                    time: time,
                                    date: date,
                                  ),
                                ),
                              );
                            }
                          },
                          child: ListTile(
                            title: RichText(
                              text: TextSpan(
                                text: recentFilesMenuOptionsList[index].Text,
                                style: primaryTextStyle(),
                              ),
                            ),
                            leading: Image.asset(
                              recentFilesMenuOptionsList[index].image!,
                              height: 20,
                              color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: recentFilesMenuOptionsBottomList.length,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 16),
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (context, int index) {
                        return GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              Navigator.pop(context);
                              RenameBottomSheetComponent(context, height);
                            } else if (index == 1) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MoveToFolderScreen()));
                            } else if (index == 3) {
                              Navigator.pop(context);
                              DeleteFileBottomSheetComponent(context, height, width, index, cardTitleText, date, time, cardImage);
                            }
                          },
                          child: ListTile(
                            title: RichText(
                              text: TextSpan(
                                text: "${recentFilesMenuOptionsBottomList[index].Text.toString()} ",
                                style: primaryTextStyle(),
                              ),
                            ),
                            leading: Image.asset(
                              recentFilesMenuOptionsBottomList[index].image.toString(),
                              height: 20,
                              width: 20,
                              color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
