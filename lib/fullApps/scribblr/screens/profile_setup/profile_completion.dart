import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main.dart';
import '../../components/date_picker.dart';
import '../../components/text_styles.dart';
import '../../utils/colors.dart';
import '../../utils/common.dart';

class ProfileComplete extends StatefulWidget {
  const ProfileComplete({super.key});

  @override
  State<ProfileComplete> createState() => _ProfileCompleteState();
}

class _ProfileCompleteState extends State<ProfileComplete> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  String? genderValue;
  final _formKey = GlobalKey<FormState>();
  List<String> genderItem = ['Male', 'Female'];

  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Complete Your profile 📋",
              style: primarytextStyle(
                  color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
            ),
            5.height,
            Text(
                "Don't worry. Only you can see your personal data. No one else will be able to see it.",
                style: secondarytextStyle()),
            15.height,
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: _image == null
                          ? null
                          : DecorationImage(
                              image: FileImage(File(_image!.path)), fit: BoxFit.fitWidth),
                      color: appStore.isDarkModeOn ? Color(0xFF1F222A) : borderColor,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(color: indicatorColor, shape: BoxShape.circle),
                      child: GestureDetector(
                        onTap: getImage,
                        child: IconButton(
                            icon: Icon(Icons.edit, size: 15, color: Colors.white),
                            onPressed: getImage),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            10.height,
            Form(
              key: _formKey,
              child: Column(
                children: [
                  30.height,
                  TextFormField(
                    style: TextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                    decoration: inputDecoration(context, labelText: 'Full Name'),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Full Name is Required';
                      }
                      return null;
                    },
                  ),
                  15.height,
                  TextFormField(
                    style: TextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                    decoration: inputDecoration(context, labelText: 'Mobile'),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mobile is Required';
                      }
                      return null;
                    },
                  ),
                  15.height,
                  Container(
                    height: 65,
                    child: DropdownButtonFormField(
                      isExpanded: true,
                      dropdownColor: appStore.isDarkModeOn ? scaffoldDarkColor : Colors.white,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Gender is Required';
                        }
                        return null;
                      },
                      hint: Text('Gender',
                          style: TextStyle(
                              color:
                                  appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor)),
                      value: genderValue?.toLowerCase(),
                      decoration: inputDecoration(context),
                      items: genderItem.map(
                        (itemValue) {
                          return DropdownMenuItem(
                            child: Text(
                              itemValue,
                              style: TextStyle(
                                  color: appStore.isDarkModeOn
                                      ? scaffoldLightColor
                                      : scaffoldDarkColor),
                            ),
                            value: itemValue.toLowerCase(),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        genderValue = value!;
                        print('Gender: $genderValue');
                        setState(() {});
                      },
                    ),
                  ),
                  15.height,
                  Container(
                    height: 65,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(20)),
                    child: DatePickerWidget(),
                  ),
                  15.height,
                ],
              ),
            ),
            40.height,
          ],
        ),
      ),
    );
  }
}
