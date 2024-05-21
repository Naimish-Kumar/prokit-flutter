import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:prokit_flutter/fullApps/proScan/component/AppButton.dart';
import 'package:prokit_flutter/fullApps/proScan/component/text_form_field_label_text.dart';
import 'package:prokit_flutter/fullApps/proScan/screens/create_account_screen.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/common.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/constant.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/images.dart';

import '../../../main.dart';
import '../utils/lists.dart';

class ProScanSignUpScreen extends StatefulWidget {
  const ProScanSignUpScreen({Key? key}) : super(key: key);

  @override
  State<ProScanSignUpScreen> createState() => _ProScanSignUpScreenState();
}

File? image;
TextEditingController nameCont = TextEditingController();
TextEditingController phoneNumberCont = TextEditingController();
TextEditingController dateInput = TextEditingController();
double progress = 0.05;

class _ProScanSignUpScreenState extends State<ProScanSignUpScreen> {
  String? dropdownValue;
  late FocusNode f1;
  late FocusNode f2;

  final _picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    }
  }

  @override
  void initState() {
    dateInput.text = "";
    f1 = FocusNode();
    f2 = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    f1.dispose();
    f2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
        title: Container(
          height: 14,
          width: width * 0.5,
          decoration: BoxDecoration(color: appStore.isDarkModeOn ? proScanDarkPrimaryColor : Colors.grey.shade300, borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS)),
          child: Row(
            children: [
              Container(
                width: width * progress,
                height: 16,
                decoration: BoxDecoration(color: proScanPrimaryColor, borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS)),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(right: 16, bottom: 80, top: 16, left: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Complete your profile", style: boldTextStyle(fontSize: 24)),
                    Image.asset(profile_image, height: 30, width: 30),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  "Don't worry, only you can see your personal data. No one else will be able to see it.",
                  style: secondaryTextStyle(color: appStore.isDarkModeOn ? proScanDarkTextSecondaryColor : Colors.black),
                ),
                SizedBox(height: 24),
                Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: appStore.isDarkModeOn ? Colors.grey : Colors.grey.shade200,
                        image: DecorationImage(
                          image: image == null
                              ? Image.asset(sign_up_screen_person_image, fit: BoxFit.contain).image
                              : Image.file(
                                  File(image!.path),
                                  fit: BoxFit.cover,
                                ).image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 4,
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
                Column(
                  children: [
                    SizedBox(height: 16),
                    TextFormFieldLabelText(text: "Full Name"),
                    TextFormField(
                      controller: nameCont,
                      focusNode: f1,
                      decoration: inputDecoration(hintText: "Full Name"),
                      onFieldSubmitted: (value) {
                        progress = 0.1;
                        f1.unfocus();
                        FocusScope.of(context).requestFocus(f2);
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormFieldLabelText(text: "Phone Number"),
                    TextFormField(
                      controller: phoneNumberCont,
                      focusNode: f2,
                      keyboardType: TextInputType.number,
                      decoration: inputDecoration(hintText: "+1 000 000 000"),
                      onFieldSubmitted: (value) {
                        progress = 0.15;
                        f2.unfocus();
                        setState(() {});
                      },
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
                          progress = 0.2;
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
                              setState(
                                () {
                                  dateInput.text = formattedDate;
                                },
                              );
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
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: AppButton(
              text: "Continue",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
