import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class ImagePickerScreen extends StatefulWidget {
  static String tag = '/image_picker';

  final bool isDirect;

  ImagePickerScreen({this.isDirect = false});

  @override
  ImagePickerScreenState createState() => ImagePickerScreenState();
}

class ImagePickerScreenState extends State<ImagePickerScreen> {
  File? pickImage;
  String fileName = '', filePath = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  Future getImage() async {
    pickImage = await getCameraImage(isCamera: false);
    if (pickImage != null) {
      fileName = pickImage!.path.split('/').last;
      filePath = pickImage!.path;
      setState(() {});
    }
  }

  Future<File> getCameraImage({bool isCamera = true}) async {
    final pickedImage = await ImagePicker().pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    return File(pickedImage!.path.validate());
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, "Image Picker", isDashboard: widget.isDirect),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("File Name:", style: boldTextStyle(size: 18)), 8.width, if (pickImage != null) Text("$fileName", style: TextStyle(fontSize: 18, color: Colors.black)).expand()],
              ).paddingAll(16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("File Path:", style: boldTextStyle(size: 18)), 8.width, if (pickImage != null) Text("$filePath", style: TextStyle(fontSize: 18, color: Colors.black)).expand()],
              ).paddingAll(16),
              if (pickImage != null)
                Container(
                  width: context.width() * 0.9,
                  height: 500,
                  child: kIsWeb
                      ? Image.network(
                          pickImage!.path,
                          fit: BoxFit.cover,
                        )
                      : Image.file(File(pickImage!.path), fit: BoxFit.cover),
                ).center(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: appColorPrimary,
                ),
                onPressed: () async {
                  await getImage();
                },
                child: Text("Pick Image", style: boldTextStyle(size: 18, color: Colors.white)),
              ).center().paddingAll(16),
            ],
          ),
        ),
      ),
    );
  }
}
