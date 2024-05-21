import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prokit_flutter/fullApps/proScan/component/AppButton.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/common.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../../../main.dart';

class AddDigitalSignatureScreen extends StatefulWidget {
  const AddDigitalSignatureScreen({Key? key}) : super(key: key);

  @override
  State<AddDigitalSignatureScreen> createState() => _AddDigitalSignatureScreenState();
}

GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
Image? signature;

class _AddDigitalSignatureScreenState extends State<AddDigitalSignatureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF262a35),
      appBar: AppBar(
        backgroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        title: Text(
          "Add Digital Signature",
          style: boldTextStyle(color: Colors.white, fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 22,
            icon: Icon(Icons.folder_open_outlined, color: Colors.white),
          ),
        ],
      ),
      body: Stack(
        children: [
          SfSignaturePad(
            key: _signaturePadKey,
            strokeColor: Colors.white,
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Column(
              children: [
                AppButton(
                  text: "Draw your Signature or add from the library",
                  onTap: () {},
                  color: Colors.black45,
                  textColor: Colors.white,
                  fontSize: 14,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: "Cancel",
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    color: appStore.isDarkModeOn ? proScanDarkPrimaryColor : Colors.black45,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: AppButton(
                    text: "Continue",
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Signature is Saved")));
                    },
                    color: proScanPrimaryColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
