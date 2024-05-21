import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prokit_flutter/fullApps/proScan/component/text_form_field_label_text.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/constant.dart';

import '../../../main.dart';
import '../models/dashboard_model_class.dart';
import '../utils/common.dart';
import '../utils/images.dart';
import 'AppButton.dart';

Future<dynamic> NewFolderBottomSheetComponent(BuildContext context) {
  final _key = GlobalKey<FormState>();
  TextEditingController folderName = TextEditingController();
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: appStore.isDarkModeOn ? proScanDarkPrimaryLightColor : Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(PRO_SCAN_DEFAULT_RADIUS)),
    ),
    elevation: 0,
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 16),
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
              Text("New Folder", style: boldTextStyle(fontSize: 24)),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              TextFormFieldLabelText(text: "Folder Name"),
              Form(
                key: _key,
                child: TextFormField(
                  controller: folderName,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: inputDecoration(hintText: "Enter Folder name"),
                  validator: (value) {
                    return nameValidator(value!);
                  },
                ),
              ),
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
                      text: "Create",
                      onTap: () {
                        if (_key.currentState!.validate()) {
                          Navigator.pop(context);
                          recentFilesList.insert(0, DashboardList(new_folder_image, folderName.text, DateFormat("MM/dd/yy").format(DateTime.now()), DateFormat("HH:mm").format(DateTime.now()), "0 files"));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your folder Created successfully")));
                        }
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
