import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main.dart';
import '../../components/custom_divider.dart';
import '../../components/social_login_component.dart';
import '../../components/text_styles.dart';
import '../../utils/colors.dart';
import '../../utils/common.dart';
import '../dashboard/dashboard.dart';
import '../profile_setup/profile_walkthrough.dart';
import 'forgot_password.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  bool _obscureText = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark,
    ));
    return Observer(builder: (context) {
      return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.height,
              Text(
                'Hello There 👋',
                style: primarytextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
              ),
              15.height,
              Text('Please enter your username/email and \npassword to sign in.', style: secondarytextStyle()),
              15.height,
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                      controller: emailController,
                      decoration: inputDecoration(context, labelText: 'Email/Username'),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email/Username is Required';
                        } else if (!emailValidate.hasMatch(value)) {
                          return 'Please Enter Valid Email/Username';
                        }
                        return null;
                      },
                    ),
                    25.height,
                    TextFormField(
                      style: TextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(DEFAULT_RADIUS), borderSide: BorderSide(color: scribblrPrimaryColor)),
                        focusColor: scribblrPrimaryColor,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(DEFAULT_RADIUS), borderSide: BorderSide(color: scribblrPrimaryColor)),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off, color: scribblrPrimaryColor),
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
                  ],
                ),
              ),
              14.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      activeColor: scribblrPrimaryColor,
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ),
                  Text('Remember me', style: TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor)),
                ],
              ),
              10.height,
              Divider(color: dividerDarkColor, thickness: appStore.isDarkModeOn ? 0.3 : 0.2),
              15.height,
              Center(
                child: TextButton(
                  onPressed: () {
                    ForgotPasswordScreen().launch(context);
                  },
                  child: Text('Forgot Password', style: TextStyle(color: scribblrPrimaryColor, fontWeight: FontWeight.w500)),
                ),
              ),
              15.height,
              Row(
                children: [
                  CustomDivider(),
                  Text('or continue with', style: secondarytextStyle()),
                  CustomDivider(),
                ],
              ),
              15.height,
              ContinueWith(),
              15.height,
              Row(
                children: [
                  CustomDivider(),
                  TextButton(
                    onPressed: () {
                      ProfileWalkthroughScreen().launch(context);
                    },
                    child: Text('Sign Up', style: TextStyle(color: scribblrPrimaryColor, fontWeight: FontWeight.w500)),
                  ),
                  CustomDivider(),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(16),
          child: AppButton(
              elevation: 0,
              onTap: () {
                DashboardScreen().launch(context);
              },
              color: scribblrPrimaryColor,
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              child: Text('Sign In', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white))),
        ),
      );
    });
  }
}
