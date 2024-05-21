import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/constant.dart';

import '../../../main.dart';
import '../component/AppButton.dart';
import '../utils/common.dart';
import '../utils/images.dart';

class CompressPdfScreen extends StatefulWidget {
  CompressPdfScreen({Key? key, this.cardTitleText, this.time, this.date}) : super(key: key);
  String? cardTitleText;
  String? date;
  String? time;

  @override
  State<CompressPdfScreen> createState() => _CompressPdfScreenState();
}

class _CompressPdfScreenState extends State<CompressPdfScreen> {
  String selectedRadioButton = "High Compression";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(elevation: 0, iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Compress PDF",
                    style: boldTextStyle(fontSize: 30),
                    // textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Reduce the size of your PDF file.", style: primaryTextStyle(fontSize: 16)),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(color: appStore.isDarkModeOn ? proScanDarkPrimaryLightColor : Colors.grey.shade200, borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS)),
                  child: Row(
                    children: [
                      Container(
                        height: height * 0.13,
                        width: width * 0.23,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS),
                          image: DecorationImage(fit: BoxFit.fill, image: AssetImage(defaultPdfImage)),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.cardTitleText!, style: boldTextStyle(), overflow: TextOverflow.fade),
                            SizedBox(height: 16),
                            Text("${widget.date} ${widget.time}", style: secondaryTextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Select compression level:",
                    style: boldTextStyle(fontSize: 18),
                    // textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 16),
                RadioListTile(
                  activeColor: proScanPrimaryColor,
                  contentPadding: EdgeInsets.symmetric(horizontal: 4),
                  title: Text("High Compression", style: boldTextStyle(fontSize: 18)),
                  subtitle: Text("Smallest size, lower quality"),
                  value: "High Compression",
                  groupValue: selectedRadioButton,
                  onChanged: (value) {
                    selectedRadioButton = value!;
                    setState(() {});
                  },
                ),
                RadioListTile(
                  activeColor: proScanPrimaryColor,
                  contentPadding: EdgeInsets.symmetric(horizontal: 4),
                  title: Text("Medium Compression", style: boldTextStyle(fontSize: 18)),
                  subtitle: Text("Medium size, medium quality"),
                  value: "Medium Compression",
                  groupValue: selectedRadioButton,
                  onChanged: (value) {
                    selectedRadioButton = value!;
                    setState(() {});
                  },
                ),
                RadioListTile(
                  activeColor: proScanPrimaryColor,
                  contentPadding: EdgeInsets.symmetric(horizontal: 4),
                  title: Text("Low Compression", style: boldTextStyle(fontSize: 18)),
                  subtitle: Text("Largest size, better quality"),
                  value: "Low Compression",
                  groupValue: selectedRadioButton,
                  onChanged: (value) {
                    selectedRadioButton = value!;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: AppButton(
              text: "Compress",
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("File is Compressed")));
              },
            ),
          ),
        ],
      ),
    );
  }
}
