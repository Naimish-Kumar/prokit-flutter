class FaqModel {
  String? title;
  String? description;
  bool? isTapped;

  FaqModel({this.title, this.description, this.isTapped});
}

List<FaqModel> helpCenterQuestionList = [
  FaqModel(
      title: "What is ProScan?",
      isTapped: false,
      description: "Welcome to ProScan, your all-in-one solution for seamless scanning and document management. With ProScan, you can effortlessly digitize your paperwork, organize files, and enhance productivity."),
  FaqModel(title: "is the ProScan App free?", isTapped: false, description: "no Description"),
  FaqModel(title: "How do i export to PDF?", isTapped: false, description: "no Description"),
  FaqModel(title: "How can i Logout from FroScan?", isTapped: false, description: "no Description"),
  FaqModel(title: "How to close ProScan Account?", isTapped: false, description: "no Description"),
];
