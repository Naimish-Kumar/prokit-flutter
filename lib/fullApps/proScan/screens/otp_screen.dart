import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/screens/create_new_password_screen.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';

import '../../../main.dart';
import '../component/AppButton.dart';
import '../utils/common.dart';
import '../utils/images.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late FocusNode f1;
  late FocusNode f2;
  late FocusNode f3;
  late FocusNode f4;
  late Timer _timer;
  int _start = 60;

  void startTimer() {
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  TextEditingController firstTF = TextEditingController();
  TextEditingController secondTF = TextEditingController();
  TextEditingController thirdTF = TextEditingController();
  TextEditingController forthTF = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    f1 = FocusNode();
    f2 = FocusNode();
    f3 = FocusNode();
    f4 = FocusNode();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
    f1.dispose();
    f2.dispose();
    f3.dispose();
    f4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "You've got mail",
                      style: boldTextStyle(fontSize: 24),
                    ),
                    SizedBox(width: 8),
                    Image.asset(
                      otp_screen_mail_image,
                      height: 30,
                      width: 30,
                    )
                  ],
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "We have sent the OTP verification code to your email address. Check your email and enter the code below.",
                    style: secondaryTextStyle(color: appStore.isDarkModeOn ? proScanDarkTextSecondaryColor : Colors.black),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: firstTF,
                        focusNode: f1,
                        cursorHeight: 0,
                        cursorWidth: 0,
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            counterText: "",
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: proScanPrimaryColor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: appStore.isDarkModeOn ? Colors.white12 : Colors.grey.shade400, width: 1),
                            ),
                            filled: true,
                            fillColor: appStore.isDarkModeOn ? proScanDarkPrimaryLightColor : Colors.grey.shade200),
                        onChanged: (value) {
                          f1.unfocus();

                          if (firstTF.text.isEmpty)
                            FocusScope.of(context).requestFocus(f1);
                          else
                            FocusScope.of(context).requestFocus(f2);
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: secondTF,
                        cursorHeight: 0,
                        cursorWidth: 0,
                        focusNode: f2,
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            counterText: "",
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: proScanPrimaryColor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: appStore.isDarkModeOn ? Colors.white12 : Colors.grey.shade400),
                            ),
                            filled: true,
                            fillColor: appStore.isDarkModeOn ? proScanDarkPrimaryLightColor : Colors.grey.shade200),
                        onChanged: (value) {
                          f2.unfocus();
                          if (secondTF.text.isEmpty)
                            FocusScope.of(context).requestFocus(f1);
                          else
                            FocusScope.of(context).requestFocus(f3);
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: thirdTF,
                        cursorHeight: 0,
                        cursorWidth: 0,
                        focusNode: f3,
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            counterText: "",
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: proScanPrimaryColor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: appStore.isDarkModeOn ? Colors.white12 : Colors.grey.shade400),
                            ),
                            filled: true,
                            fillColor: appStore.isDarkModeOn ? proScanDarkPrimaryLightColor : Colors.grey.shade200),
                        onChanged: (value) {
                          f3.unfocus();
                          if (thirdTF.text.isEmpty)
                            FocusScope.of(context).requestFocus(f2);
                          else
                            FocusScope.of(context).requestFocus(f4);
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: forthTF,
                        cursorHeight: 0,
                        cursorWidth: 0,
                        focusNode: f4,
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            counterText: "",
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: proScanPrimaryColor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: appStore.isDarkModeOn ? Colors.white12 : Colors.grey.shade400),
                            ),
                            filled: true,
                            fillColor: appStore.isDarkModeOn ? proScanDarkPrimaryLightColor : Colors.grey.shade200),
                        onChanged: (value) {
                          f4.unfocus();
                          if (forthTF.text.isEmpty) FocusScope.of(context).requestFocus(f3);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Text("Didn't receive an email?", style: primaryTextStyle()),
                SizedBox(height: 18),
                RichText(
                  text: TextSpan(
                    text: "You can resend code in",
                    style: primaryTextStyle(),
                    children: [
                      TextSpan(
                        text: " $_start ",
                        style: primaryTextStyle(color: proScanPrimaryColor),
                      ),
                      TextSpan(
                        text: "s",
                        style: primaryTextStyle(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: AppButton(
              text: "Confirm",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNewPasswordScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
