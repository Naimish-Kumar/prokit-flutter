import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/component/AppButton.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';

import '../../../main.dart';
import '../component/text_form_field_label_text.dart';
import '../utils/common.dart';

class TabBarWatermarkTextScreen extends StatelessWidget {
  const TabBarWatermarkTextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appStore.isDarkModeOn ? proScanDarkPrimaryLightColor : Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          TextFormFieldLabelText(text: "Your Text"),
          TextFormField(
            decoration: inputDecoration(hintText: "Enter your text"),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppButton(
                  text: "Cancel",
                  onTap: () {
                    Navigator.pop(context);
                  },
                  color: appStore.isDarkModeOn ? proScanDarkPrimaryColor : proScanPrimaryLightColor,
                  textColor: appStore.isDarkModeOn ? Colors.white : proScanPrimaryColor,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: AppButton(
                    text: "Continue",
                    color: proScanPrimaryColor,
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Watermark is added")));
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
