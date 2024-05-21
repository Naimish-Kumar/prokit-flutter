import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:prokit_flutter/fullApps/proScan/component/AppButton.dart';
import 'package:prokit_flutter/fullApps/proScan/screens/sign_up_screen.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/common.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/constant.dart';

import '../../../main.dart';
import '../component/text_form_field_label_text.dart';
import '../utils/images.dart';
import '../utils/lists.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _picker = ImagePicker();

  String? dropdownValue;

  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Personal Info",
          style: boldTextStyle(fontSize: 24),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 22,
            icon: Image.asset(rename_image, height: 26, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 32),
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: appStore.isDarkModeOn ? Colors.grey : Colors.grey.shade200,
                      image: DecorationImage(
                        image: image == null ? Image.asset(sign_up_screen_person_image, color: Colors.grey, fit: BoxFit.contain).image : Image.file(File(image!.path), fit: BoxFit.cover).image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 110,
                  child: GestureDetector(
                    onTap: () {
                      getImage();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(color: proScanPrimaryColor, borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS)),
                      child: Icon(Icons.edit, color: Colors.white, size: 16),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Column(
              children: [
                TextFormFieldLabelText(text: "Full name"),
                TextFormField(
                  decoration: inputDecoration(hintText: "Full Name"),
                ),
                SizedBox(height: 16),
                TextFormFieldLabelText(text: "Email"),
                TextFormField(
                  decoration: inputDecoration(hintText: "Email Id"),
                ),
                SizedBox(height: 16),
                TextFormFieldLabelText(text: "Phone Number"),
                TextFormField(
                  decoration: inputDecoration(hintText: "Phone Number"),
                ),
                SizedBox(height: 16),
                TextFormFieldLabelText(text: "Gender"),
                DropdownButtonFormField(
                  decoration: inputDecoration(hintText: 'Select Gender'),
                  borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS),
                  dropdownColor: appStore.isDarkModeOn ? proScanDarkPrimaryLightColor : Colors.white,
                  value: dropdownValue,
                  icon: Icon(Icons.keyboard_arrow_down, size: 30, color: proScanPrimaryColor),
                  style: TextStyle(fontSize: 18, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                  items: genders.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
                SizedBox(height: 16),
                TextFormFieldLabelText(text: "Date of Birth"),
                TextFormField(
                  readOnly: true,
                  controller: dateInput,
                  decoration: inputDecoration(
                    hintText: "MM/DD/YYYY",
                    suffixIcon: GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          String formattedDate = DateFormat('MM/dd/yyyy').format(pickedDate);
                          setState(() {
                            dateInput.text = formattedDate;
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Icon(Icons.calendar_month_rounded, color: proScanPrimaryColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextFormFieldLabelText(text: "Street Address"),
                TextFormField(
                  decoration: inputDecoration(hintText: "Street Address"),
                ),
                SizedBox(height: 16),
                TextFormFieldLabelText(text: "Country"),
                TextFormField(
                  decoration: inputDecoration(hintText: "Country"),
                ),
                SizedBox(height: 16),
                TextFormFieldLabelText(text: "State"),
                TextFormField(
                  decoration: inputDecoration(hintText: "State"),
                ),
                SizedBox(height: 24),
                AppButton(
                    text: "Save",
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
