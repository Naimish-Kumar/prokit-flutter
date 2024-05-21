import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main.dart';
import '../../components/text_styles.dart';
import '../../utils/colors.dart';
import '../../utils/common.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Create an account 🔐", style: primarytextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor)),
              15.height,
              Text("Enter your username, email & password. If you forget then you have to do forget password.", style: secondarytextStyle()),
              15.height,
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                      decoration: inputDecoration(context, labelText: 'Username'),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username is Required';
                        }
                        return null;
                      },
                    ),
                    15.height,
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
                    15.height,
                    TextFormField(
                      style: TextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(DEFAULT_RADIUS),borderSide: BorderSide(color: scribblrPrimaryColor)),
                        focusColor: scribblrPrimaryColor,

                        labelStyle: TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(DEFAULT_RADIUS)),
                        labelText: 'Password',
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
                      decoration: inputDecoration(context, labelText: 'Confirm Password'),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obscureText,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirm Password is Required';
                        }
                        return null;
                      },
                    ),
                    20.height,
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
