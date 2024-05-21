import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main.dart';
import '../../components/text_styles.dart';
import '../../utils/images.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final List<Map<String, String>> aboutUsData = [
    {'text': 'Job Vacancy'},
    {'text': 'Developer'},
    {'text': 'Partner'},
    {'text': 'Accessibility'},
    {'text': 'Privacy Policy'},
    {'text': 'Feedback'},
    {'text': 'Rate Us'},
    {'text': 'Visit Our Website'},
    {'text': 'Follow us on Social Media'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: context.scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
        backgroundColor: context.scaffoldBackgroundColor,
        title: Text('About Scribblr',
            style: primarytextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.height,
            Center(child: Image.asset(app_logo, width: 200, fit: BoxFit.cover)),
            10.height,
            Center(
              child: Text(
                'Scribblr v1.0.0',
                style: TextStyle(
                    color: appStore.isDarkModeOn ? Colors.white : Colors.black, fontSize: 20),
              ),
            ),
            Divider(thickness: appStore.isDarkModeOn ? 0.3 : 0.2, color: dividerDarkColor),
            ListView.builder(
              shrinkWrap: true,
              itemCount: aboutUsData.length,
              itemBuilder: (context, index) {
                final item = aboutUsData[index];
                return ListTile(
                  title: Text(item['text']!,
                      style: primarytextStyle(
                          color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
