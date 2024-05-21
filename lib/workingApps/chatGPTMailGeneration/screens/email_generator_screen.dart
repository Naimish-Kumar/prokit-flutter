import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/workingApps/chatGPTMailGeneration/screens/generated_email_screen.dart';

import '../../../main/utils/AppColors.dart';
import '../../chatGPTMailGeneration/utils/common.dart';

class EmailGeneratorScreen extends StatefulWidget {
  @override
  _EmailGeneratorScreenState createState() => _EmailGeneratorScreenState();
}

class _EmailGeneratorScreenState extends State<EmailGeneratorScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController fNameController = TextEditingController();
  TextEditingController toNameController = TextEditingController();
  TextEditingController keyPointsController = TextEditingController();

  FocusNode fNameFocus = FocusNode();
  FocusNode toNameFocus = FocusNode();
  FocusNode keyPointsFocus = FocusNode();

  int selectedToneIndex = -1;
  int selectedLengthIndex = -1;

  String finalText = '';
  String selectedToneText = '';
  String selectedLengthText = '';
  String errorLengthText = '';
  String errorToneText = '';

  bool isSelectedTone = false;
  bool isSelectedLength = false;

  List<String> lengthList = ['Short', 'Medium', 'Long'];
  List<String> toneList = ['Friendly', 'Luxury', 'Relaxed', 'Professional', 'Adventurous', 'Witty', 'Persuasive', 'Bold', 'Empathetic'];

  @override
  void initState() {
    super.initState();
    afterBuildCreated(() {
      setStatusBarColor(appStore.isDarkModeOn ? context.scaffoldBackgroundColor : appColorPrimaryLight, statusBarIconBrightness: Brightness.dark);
    });
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget _buildFormWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('From Name', style: primaryTextStyle()),
        6.height,
        AppTextField(
          textFieldType: TextFieldType.NAME,
          controller: fNameController,
          focus: fNameFocus,
          nextFocus: toNameFocus,
          isValidationRequired: false,
          textInputAction: TextInputAction.next,
          cursorColor: appStore.isDarkModeOn ? Colors.white : Colors.black,
          decoration: inputDecoration(context, label: 'From Name (Optional)'),
        ),
        16.height,
        Text('To Name', style: primaryTextStyle()),
        6.height,
        AppTextField(
          textFieldType: TextFieldType.NAME,
          controller: toNameController,
          focus: toNameFocus,
          nextFocus: keyPointsFocus,
          isValidationRequired: false,
          textInputAction: TextInputAction.next,
          cursorColor: appStore.isDarkModeOn ? Colors.white : Colors.black,
          decoration: inputDecoration(context, label: 'To Name (Optional)'),
        ),
        16.height,
        Text('Key Points*', style: primaryTextStyle()),
        6.height,
        AppTextField(
          textFieldType: TextFieldType.MULTILINE,
          controller: keyPointsController,
          focus: keyPointsFocus,
          minLines: 1,
          maxLines: 5,
          textInputAction: TextInputAction.done,
          cursorColor: appStore.isDarkModeOn ? Colors.white : Colors.black,
          decoration: inputDecoration(context, label: 'Write the main topic of your email here.'),
        ),
      ],
    );
  }

  Widget _buildToneWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Select Tone*', style: primaryTextStyle()),
            8.width,
            if (errorToneText.isNotEmpty) Text(errorToneText, style: primaryTextStyle(size: 12, color: Colors.red)),
          ],
        ),
        8.height,
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(toneList.length, (index) {
            return GestureDetector(
              onTap: () {
                if (index == selectedToneIndex) {
                  isSelectedTone = !isSelectedTone;
                }

                selectedToneIndex = index;

                if (isSelectedTone && index == selectedToneIndex) {
                  selectedToneText = '${toneList[index]}';
                  errorToneText = '';
                } else {
                  selectedToneText = '';
                }

                log('SELECTED TONE: $selectedToneText');
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: boxDecorationDefault(
                  borderRadius: radius(defaultRadius),
                  color: appStore.isDarkModeOn
                      ? (index == selectedToneIndex && isSelectedTone)
                          ? appColorPrimary
                          : Colors.white12
                      : (index == selectedToneIndex && isSelectedTone)
                          ? appColorPrimary
                          : context.cardColor,
                  boxShadow: defaultBoxShadow(spreadRadius: 0, blurRadius: 0, shadowColor: Colors.transparent),
                ),
                child: Text(
                  toneList[index],
                  style: primaryTextStyle(size: 14, color: (index == selectedToneIndex && isSelectedTone) ? Colors.white : null),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildLengthWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Select Length*', style: primaryTextStyle()),
            8.width,
            if (errorLengthText.isNotEmpty) Text(errorLengthText, style: primaryTextStyle(size: 12, color: Colors.red)),
          ],
        ),
        8.height,
        Wrap(
          spacing: 10,
          children: List.generate(lengthList.length, (index) {
            return GestureDetector(
              onTap: () {
                if (index == selectedLengthIndex) {
                  isSelectedLength = !isSelectedLength;
                }

                selectedLengthIndex = index;

                if (isSelectedLength && index == selectedLengthIndex) {
                  selectedLengthText = '${lengthList[index]}';
                  errorLengthText = '';
                } else {
                  selectedLengthText = '';
                }

                log('SELECTED Length: $selectedLengthText');
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: boxDecorationDefault(
                  borderRadius: radius(defaultRadius),
                  color: appStore.isDarkModeOn
                      ? (index == selectedLengthIndex && isSelectedLength)
                          ? appColorPrimary
                          : Colors.white12
                      : (index == selectedLengthIndex && isSelectedLength)
                          ? appColorPrimary
                          : context.cardColor,
                  boxShadow: defaultBoxShadow(spreadRadius: 0, blurRadius: 0, shadowColor: Colors.transparent),
                ),
                child: Text(
                  lengthList[index],
                  style: primaryTextStyle(size: 14, color: (index == selectedLengthIndex && isSelectedLength) ? Colors.white : null),
                ),
              ),
            );
          }),
        ),
        8.height,
      ],
    );
  }

  @override
  void dispose() {
    setStatusBarColor(appStore.scaffoldBackground!);
    fNameController.dispose();
    toNameController.dispose();
    keyPointsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('', elevation: 0, color: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : appColorPrimaryLight),
      body: Container(
        height: context.height(),
        width: context.width(),
        color: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : appColorPrimaryLight,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Smart Email Generator', style: boldTextStyle(size: 20)),
            20.height,
            Container(
              height: context.height(),
              width: context.width(),
              decoration: boxDecorationDefault(color: appStore.isDarkModeOn ? appSecondaryBackgroundColor : Colors.white, borderRadius: radius(defaultRadius)),
              child: Stack(
                children: [
                  Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFormWidget(),
                          20.height,
                          _buildToneWidget(),
                          20.height,
                          _buildLengthWidget(),
                        ],
                      ),
                    ).paddingBottom(70),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: AppButton(
                      text: 'Generate Email',
                      color: appColorPrimary,
                      width: context.width(),
                      textColor: Colors.white,
                      onTap: () {
                        hideKeyboard(context);

                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          if (selectedToneText.isNotEmpty && selectedLengthText.isNotEmpty) {
                            finalText = 'Write a $selectedLengthText and $selectedToneText email for ${keyPointsController.text} to ${toNameController.text.trim()} from ${fNameController.text.trim()}';
                            GeneratedEmailScreen(question: finalText).launch(context);
                          } else {
                            if (selectedToneText.isEmpty) {
                              errorToneText = 'Tone is required';
                            }

                            if (selectedLengthText.isEmpty) {
                              errorLengthText = 'Length is required';
                            }

                            setState(() {});
                          }
                        } else {
                          if (selectedToneText.isEmpty) {
                            errorToneText = 'Tone is required';
                          }

                          if (selectedLengthText.isEmpty) {
                            errorLengthText = 'Length is required';
                          }

                          setState(() {});
                        }
                      },
                    ),
                  ),
                ],
              ),
            ).expand(),
          ],
        ),
      ),
    );
  }
}
