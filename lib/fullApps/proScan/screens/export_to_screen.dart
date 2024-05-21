import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/common.dart';

import '../../../main.dart';
import '../component/AppButton.dart';
import '../component/text_form_field_label_text.dart';
import '../models/export_to_screen_model_classes.dart';

class ExportToScreen extends StatefulWidget {
  ExportToScreen({Key? key, required this.export_to_text}) : super(key: key);
  final String export_to_text;

  @override
  State<ExportToScreen> createState() => _ExportToScreenState();
}

class _ExportToScreenState extends State<ExportToScreen> {
  ExportDocumentsOptions userSelected = exportScreenDocumentsOptionsList.first;

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 24, bottom: 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Export to...",
                    style: boldTextStyle(fontSize: 30),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Export \"${widget.export_to_text}\" to...", style: secondaryTextStyle(fontSize: 16)),
                ),
                SizedBox(height: 8),
                Divider(indent: 16, endIndent: 16),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormFieldLabelText(text: "Documents", style: primaryTextStyle(fontSize: 20, color: appStore.isDarkModeOn ? proScanDarkTextPrimaryColor : Colors.black45)),
                ),
                SizedBox(height: 8),
                ListView.separated(
                  itemCount: exportScreenDocumentsOptionsList.length,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, int index) {
                    return InkWell(
                      onTap: () {
                        selectedIndex = index;

                        setState(() {});
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            margin: EdgeInsets.symmetric(vertical: 2),
                            child: Row(
                              children: [
                                Expanded(
                                  child: RichText(
                                    overflow: TextOverflow.fade,
                                    text: TextSpan(
                                      text: "${exportScreenDocumentsOptionsList[index].title} ",
                                      style: primaryTextStyle(),
                                      children: [
                                        TextSpan(
                                          text: "${exportScreenDocumentsOptionsList[index].ext} ",
                                          style: primaryTextStyle(),
                                        ),
                                        TextSpan(
                                          text: "${exportScreenDocumentsOptionsList[index].size}",
                                          style: secondaryTextStyle(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Icon(Icons.check,
                                    size: 20,
                                    color: appStore.isDarkModeOn
                                        ? selectedIndex == index
                                            ? proScanPrimaryColor
                                            : Color(0xFF181a20)
                                        : selectedIndex == index
                                            ? proScanPrimaryColor
                                            : Colors.white),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(height: 0);
                  },
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormFieldLabelText(text: "Images", style: primaryTextStyle(fontSize: 20, color: appStore.isDarkModeOn ? proScanDarkTextPrimaryColor : Colors.black45)),
                ),
                SizedBox(height: 8),
                ListView.separated(
                  itemCount: exportScreenImagesOptionsList.length,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, int index) {
                    return InkWell(
                      onTap: () {
                        selectedIndex = exportScreenDocumentsOptionsList.length + index;
                        setState(() {});
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            margin: EdgeInsets.symmetric(vertical: 2),
                            child: Row(
                              children: [
                                Expanded(
                                  child: RichText(
                                    overflow: TextOverflow.fade,
                                    text: TextSpan(
                                      text: "${exportScreenImagesOptionsList[index].title} ",
                                      style: primaryTextStyle(),
                                      children: [
                                        TextSpan(
                                          text: "${exportScreenImagesOptionsList[index].ext} ",
                                          style: primaryTextStyle(),
                                        ),
                                        TextSpan(
                                          text: "${exportScreenImagesOptionsList[index].size}",
                                          style: secondaryTextStyle(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Icon(Icons.check,
                                    size: 20,
                                    color: appStore.isDarkModeOn
                                        ? selectedIndex == (index + exportScreenDocumentsOptionsList.length)
                                            ? proScanPrimaryColor
                                            : Color(0xFF181a20)
                                        : selectedIndex == (index + exportScreenDocumentsOptionsList.length)
                                            ? proScanPrimaryColor
                                            : Colors.white),
                              ],
                            ),
                          ),
                          // SizedBox(height: 4),
                          // Divider(),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(height: 0);
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: AppButton(
              text: "Export",
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("File is Exported")));
              },
            ),
          )
        ],
      ),
    );
  }
}
// Radio(
//   groupValue: userSelected,
//   value: exportScreenImagesOptionsList[index],
//   onChanged: (value) {
//     userSelected = value!;
//
//     setState(() {});
//   },
// )
