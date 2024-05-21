import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/component/rename_bottom_sheet_component.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/constant.dart';

import '../../../main.dart';
import '../models/dashboard_model_class.dart';
import '../screens/move_to_folder_screen.dart';
import '../utils/common.dart';
import '../utils/images.dart';
import 'delete_file_bottom_sheet_component.dart';

Future<dynamic> FolderBottomSheetComponent(BuildContext context, double height, double width,
    {String? cardImage, String? cardTitleText, String? date, String? time, int? listIndex, String? fileText}) {
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
        maxChildSize: 0.7,
        minChildSize: 0.4,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: SizedBox(
              height: height * 0.7,
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
                    decoration: BoxDecoration(
                        color: appStore.isDarkModeOn ? proScanDarkPrimaryColor : Colors.grey.shade200, borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS)),
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
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cardTitleText!, style: primaryTextStyle(), overflow: TextOverflow.fade),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Image.asset(document_image, color: Colors.grey, height: 15, width: 15),
                                  SizedBox(width: 8),
                                  Text(fileText!, style: secondaryTextStyle()),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text("${date} ${time}", style: secondaryTextStyle()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Divider(indent: 16, endIndent: 16),
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
