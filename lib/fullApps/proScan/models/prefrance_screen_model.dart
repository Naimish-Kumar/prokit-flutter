class PreferenceOptionModel {
  String? title;
  bool? isSwitch;
  bool? isTapped;

  PreferenceOptionModel({this.title, this.isSwitch, this.isTapped});
}

List<PreferenceOptionModel> preferenceScreenList = [
  PreferenceOptionModel(title: "High Quality Scan", isSwitch: true, isTapped: false),
  PreferenceOptionModel(title: "Auto Crop Image", isSwitch: true, isTapped: false),
  PreferenceOptionModel(title: "Enhance Mode", isSwitch: false, isTapped: false),
];
List<PreferenceOptionModel> securityScreenList = [
  PreferenceOptionModel(title: "Remember me", isSwitch: true, isTapped: false),
  PreferenceOptionModel(title: "Biometric ID", isSwitch: true, isTapped: false),
  PreferenceOptionModel(title: "Face ID", isSwitch: true, isTapped: false),
  PreferenceOptionModel(title: "SMS Authenticator", isSwitch: true, isTapped: false),
  PreferenceOptionModel(title: "Google Authenticator", isSwitch: true, isTapped: false),
  PreferenceOptionModel(title: "Device Management", isSwitch: false, isTapped: false),
];
