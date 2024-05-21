import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/component/AppButton.dart';
import 'package:prokit_flutter/fullApps/proScan/models/dashboard_model_class.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/constant.dart';

import '../../../main.dart';
import '../component/text_form_field_label_text.dart';
import '../utils/common.dart';
import 'account_screen.dart';

class MergePdfScreen extends StatelessWidget {
  MergePdfScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(elevation: 0, iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 16, bottom: 100, right: 16, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Merge PDF",
                  style: boldTextStyle(fontSize: 30),
                  // textAlign: TextAlign.left,
                ),
                SizedBox(height: 16),
                Text("2 Selected files to be merged", style: secondaryTextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Divider(),
                SizedBox(height: 8),
                TextFormFieldLabelText(text: "File Name", style: boldTextStyle()),
                TextFormField(
                  decoration: inputDecoration(hintText: "Enter file name"),
                ),
                SizedBox(height: 16),
                ListView.builder(
                    itemCount: 2,
                    primary: false,
                    padding: EdgeInsets.only(bottom: 16),
                    shrinkWrap: true,
                    itemBuilder: (context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
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
                                image: DecorationImage(fit: BoxFit.fill, image: AssetImage(dashboardFilesList[index].image.toString())),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dashboardFilesList[index].titleText.toString(),
                                    style: boldTextStyle(),
                                    overflow: TextOverflow.fade,
                                  ),
                                  SizedBox(height: 16),
                                  Text("${dashboardFilesList[index].date}  ${dashboardFilesList[index].time}", style: secondaryTextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                            IconButton(onPressed: () {}, icon: Icon(Icons.close))
                          ],
                        ),
                      );
                    }),
                AppButton(
                  text: "+ Add more files",
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => RecentFilesScreen()));
                  },
                  color: appStore.isDarkModeOn ? proScanDarkPrimaryColor : proScanPrimaryLightColor,
                  textColor: appStore.isDarkModeOn ? Colors.white : proScanPrimaryColor,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: AppButton(
              text: "Merge",
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Files merged")));
              },
            ),
          ),
        ],
      ),
    );
  }
}
