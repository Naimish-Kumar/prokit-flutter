import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/common.dart';

import '../../../main.dart';
import '../component/text_form_field_label_text.dart';
import '../models/prefrance_screen_model.dart';
import 'account_screen.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({Key? key}) : super(key: key);

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  bool isTappedForGallery = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Preferences", style: boldTextStyle(fontSize: 24)),
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormFieldLabelText(text: "Scan", style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.grey)),
            ),
            SizedBox(height: 8),
            ListView.builder(
              itemCount: preferenceScreenList.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, int index) {
                return GestureDetector(
                  onTap: () {
                    //
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 8),
                    child: Row(
                      children: [
                        Text(preferenceScreenList[index].title!, style: primaryTextStyle()),
                        Spacer(),
                        preferenceScreenList[index].isSwitch == true
                            ? Switch(
                                value: preferenceScreenList[index].isTapped!,
                                activeTrackColor: proScanPrimaryColor,
                                activeColor: Colors.white,
                                onChanged: (value) {
                                  setState(() {
                                    preferenceScreenList[index].isTapped = value;
                                  });
                                },
                              )
                            : IconButton(
                                splashRadius: 1,
                                onPressed: () {},
                                icon: Icon(Icons.arrow_forward_ios, size: 20, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                              ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Divider(),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextFormFieldLabelText(text: "File Naming", style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.grey)),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                //
              },
              child: preferencesTile(title: "Default File Name"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Divider(),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormFieldLabelText(text: "Files & Storage", style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.grey)),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                //
              },
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 8),
                child: Row(
                  children: [
                    Text("Save Original Image to Gallery ", style: primaryTextStyle()),
                    Spacer(),
                    Switch(
                      value: isTappedForGallery,
                      activeTrackColor: proScanPrimaryColor,
                      activeColor: Colors.white,
                      onChanged: (value) {
                        setState(
                          () {
                            isTappedForGallery = value;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //
              },
              child: preferencesTile(title: "Free Up Storage"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Divider(),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormFieldLabelText(text: "Payment & Subscriptions", style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.grey)),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                //
              },
              child: preferencesTile(title: "Subscription Management"),
            ),
            GestureDetector(
              onTap: () {
                //
              },
              child: preferencesTile(title: "Manage Payment Methods"),
            ),
            Divider(),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormFieldLabelText(text: "Cloud & Sync", style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.grey)),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                //
              },
              child: preferencesTile(title: "Accounts"),
            ),
          ],
        ),
      ),
    );
  }
}

class preferencesTile extends StatelessWidget {
  const preferencesTile({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 8),
      child: Row(
        children: [
          Text(title, style: primaryTextStyle()),
          Spacer(),
          IconButton(onPressed: () {}, splashRadius: 1, icon: Icon(Icons.arrow_forward_ios, size: 20)),
        ],
      ),
    );
  }
}
