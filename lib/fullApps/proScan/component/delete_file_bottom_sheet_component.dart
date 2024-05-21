import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/constant.dart';

import '../../../main.dart';
import '../utils/common.dart';
import 'AppButton.dart';

Future<dynamic> DeleteFileBottomSheetComponent(
    BuildContext context, double height, double width, int index, String cardTitleText, String? date, String? time, String? cardImage) {
  return showModalBottomSheet(
    backgroundColor: appStore.isDarkModeOn ? proScanDarkPrimaryLightColor : Colors.white,
    elevation: 0,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(PRO_SCAN_DEFAULT_RADIUS))),
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 24),
        child: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              Container(
                height: 2,
                width: 40,
                decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS)),
              ),
              SizedBox(height: 16),
              Text("Delete", style: boldTextStyle(fontSize: 24, color: Colors.red)),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration:
                    BoxDecoration(color: appStore.isDarkModeOn ? proScanDarkPrimaryColor : Colors.grey.shade200, borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS)),
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
                          Text(cardTitleText, style: boldTextStyle(), overflow: TextOverflow.fade),
                          SizedBox(height: 16),
                          Text("${date} ${time}", style: secondaryTextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Are you sure you want to delete this file?",
                style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : Color(0xFF1A1818)),
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      text: "Cancel",
                      color: appStore.isDarkModeOn ? proScanDarkPrimaryColor : proScanPrimaryLightColor,
                      textColor: appStore.isDarkModeOn ? Colors.white : proScanPrimaryColor,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: AppButton(
                      text: "Yes, Delete",
                      onTap: () {
                        Navigator.pop(context);

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your file deleted successfully")));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
