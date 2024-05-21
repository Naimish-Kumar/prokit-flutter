import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main.dart';
import '../../components/resend_pin.dart';
import '../../components/text_styles.dart';
import '../../utils/colors.dart';
import '../../utils/common.dart';
import '../../utils/images.dart';
import '../dashboard/dashboard.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          surfaceTintColor: context.scaffoldBackgroundColor,
          iconTheme:
              IconThemeData(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
          backgroundColor: context.scaffoldBackgroundColor,
        ),
        body: PageView.builder(
          // Use the PageController
          controller: _pageController,
          itemCount: 3,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return Screen1();
              case 1:
                return Screen2();
              case 2:
                return Screen3();

              default:
                return Screen1();
            }
          },
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(16),
          child: AppButton(
            elevation: 0,
            onTap: () async {
              if (_currentIndex == 2) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.of(context).pop(); // pop the dialog after 7 seconds
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => DashboardScreen()));
                    });
                    return AlertDialog(
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      contentPadding: EdgeInsets.all(16),
                      actions: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 15),
                            Container(
                              width: 80,
                              height: 80,
                              decoration:
                                  BoxDecoration(shape: BoxShape.circle, color: indicatorColor),
                              child: Icon(Icons.check, color: Colors.white, size: 28),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Reset Password \nSuccessful!',
                              style: TextStyle(color: scribblrPrimaryColor),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Your Password has been successfully changed.',
                              style: secondaryTextStyle(),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),
                            Lottie.asset(loader_lottie, width: 100, fit: BoxFit.cover),
                          ],
                        ),
                      ],
                    );
                  },
                );
              } else {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              }
            },
            color: scribblrPrimaryColor,
            shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Text('Continue',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white)),
          ),
        ),
      );
    });
  }
}

//Email Sending Screen

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Forgot Password 🔑',
            style: primarytextStyle(
                color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
          ),
          15.height,
          Text(
              'Enter your email address. We will send an OTP \ncode for verification in the next step.',
              style: secondarytextStyle()),
          25.height,
          TextFormField(
            style: TextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
            controller: emailController,
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
        ],
      ),
    );
  }
}

// OTP verification screen
class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You've Got an Mail 📩",
              style: primarytextStyle(
                  color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
            ),
            15.height,
            Text(
                "We have sent the OTP verification code to your email address. Check your email and enter the code below.",
                style: secondarytextStyle()),
            15.height,
            Center(
              child: OTPTextField(
                pinLength: 4,
                boxDecoration: BoxDecoration(
                    color: appStore.isDarkModeOn ? Color(0xFF1F222A) : borderColor,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: skipbutton, width: 1.0)),
                textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
                fieldWidth: 60,
                cursorColor: scribblrPrimaryColor,
              ),
            ),
            15.height,
            Center(
                child: Text(
              "Didn't Receive email?",
              style:
                  TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
            )),
            15.height,
            ResendPin(),
          ],
        ),
      ),
    );
  }
}

// Create new password screen

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  bool _obscureText = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create New Password 🔐',
                style: primarytextStyle(
                    color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
              ),
              15.height,
              Text(
                  "Enter your new password. If you forgot it, then you have to do forgot password.",
                  style: secondarytextStyle()),
              15.height,
              TextFormField(
                style: TextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(DEFAULT_RADIUS),
                      borderSide: BorderSide(color: scribblrPrimaryColor)),
                  focusColor: scribblrPrimaryColor,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(DEFAULT_RADIUS)),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
                  suffixIcon: IconButton(
                    icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                obscureText: _obscureText,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is Required';
                  }
                  return null;
                },
              ),
              15.height,
              TextFormField(
                style: TextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(DEFAULT_RADIUS),
                      borderSide: BorderSide(color: scribblrPrimaryColor)),
                  focusColor: scribblrPrimaryColor,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(DEFAULT_RADIUS)),
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(
                      color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
                  suffixIcon: IconButton(
                    icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                obscureText: _obscureText,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm Password is Required';
                  }
                  return null;
                },
              ),
              14.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ),
                  Text(
                    'Remember me',
                    style: TextStyle(
                        color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
