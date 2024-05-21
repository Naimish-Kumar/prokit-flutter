import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main.dart';
import '../../components/date_picker.dart';
import '../../components/text_styles.dart';
import '../../utils/colors.dart';
import '../../utils/common.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  List<String> genderItem = ['Male', 'Female'];
  String? genderValue;

  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          surfaceTintColor: context.scaffoldBackgroundColor,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          title: Text(
            'Personal Info',
            style: primarytextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          ),
          backgroundColor: context.scaffoldBackgroundColor,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.height,
              Form(
                key: _formKey,
                child: Column(
                  children: [
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
                                      image: FileImage(
                                        File(_image!.path),
                                      ),
                                      fit: BoxFit.fitWidth,
                                    ),
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
                                child: IconButton(icon: Icon(Icons.edit, size: 15, color: Colors.white), onPressed: getImage),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                      controller: emailController,
                      style: TextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                      decoration: inputDecoration(context, labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email is Required';
                        } else if (!emailValidate.hasMatch(value)) {
                          return 'Please Enter Valid Email';
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
                        dropdownColor: appStore.isDarkModeOn ? Color(0xFF1F222A) : context.scaffoldBackgroundColor,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Gender is Required';
                          }
                          return null;
                        },
                        hint: Text('Gender', style: TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor)),
                        value: genderValue?.toLowerCase(),
                        decoration: inputDecoration(context),
                        items: genderItem.map((itemValue) {
                          return DropdownMenuItem(
                            child: Text(itemValue, style: TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor)),
                            value: itemValue.toLowerCase(),
                          );
                        }).toList(),
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
                      decoration: BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(20)),
                      child: DatePickerWidget(),
                    ),
                    15.height,
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
