import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';

import '../../../main.dart';
import '../component/AppButton.dart';
import '../component/text_form_field_label_text.dart';
import '../utils/common.dart';

class ProtectPdfScreen extends StatefulWidget {
  ProtectPdfScreen({Key? key}) : super(key: key);

  @override
  State<ProtectPdfScreen> createState() => _ProtectPdfScreenState();
}

class _ProtectPdfScreenState extends State<ProtectPdfScreen> {
  bool obText = true;

  bool confirmObText = true;

  TextEditingController passwordCont = TextEditingController();
  TextEditingController confirmPasswordCont = TextEditingController();

  late FocusNode f1;
  late FocusNode f2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    f1 = FocusNode();
    f2 = FocusNode();
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
    return Scaffold(
      appBar: AppBar(elevation: 0, iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 16, bottom: 80, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Protect PDF",
                  style: boldTextStyle(fontSize: 30),
                  // textAlign: TextAlign.left,
                ),
                SizedBox(height: 16),
                Text("Set a password to protect your scan. This password will be required if you or the person you provide the scanned document wants to access the file. If you forget the password, then this file will not be accessible forever.",
                    style: secondaryTextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Divider(),
                SizedBox(height: 8),
                Column(
                  children: [
                    TextFormFieldLabelText(text: "Password"),
                    TextFormField(
                      focusNode: f1,
                      controller: passwordCont,
                      obscureText: obText,
                      textInputAction: TextInputAction.next,
                      decoration: inputDecoration(
                        hintText: "Password",
                        suffixIcon: GestureDetector(
                            onTap: () {
                              obText = !obText;
                              setState(() {});
                            },
                            child: Icon(obText ? Icons.visibility_off : Icons.visibility, color: proScanPrimaryColor)),
                      ),
                      onFieldSubmitted: (value) {
                        f1.unfocus();
                        FocusScope.of(context).requestFocus(f2);
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormFieldLabelText(text: "Confirm Password"),
                    TextFormField(
                      focusNode: f2,
                      controller: confirmPasswordCont,
                      obscureText: confirmObText,
                      textInputAction: TextInputAction.next,
                      decoration: inputDecoration(
                        hintText: "Confirm Password",
                        suffixIcon: GestureDetector(
                            onTap: () {
                              confirmObText = !confirmObText;
                              setState(() {});
                            },
                            child: Icon(confirmObText ? Icons.visibility_off : Icons.visibility, color: proScanPrimaryColor)),
                      ),
                      onFieldSubmitted: (value) {
                        f2.unfocus();
                      },
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
              text: "Protect",
              onTap: () {
                if (passwordCont.text.compareTo(confirmPasswordCont.text) == 0) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("File is Protected")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("password and confirm password must be same, please enter same password")));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
