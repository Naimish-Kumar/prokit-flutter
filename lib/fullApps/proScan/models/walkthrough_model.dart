class Walkthrough {
  String? image;
  String? titleText;
  String? bodyText;
  Walkthrough({this.image, this.titleText, this.bodyText});
}

List<Walkthrough> WalkthroughPages = [
  Walkthrough(
      image: "images/proScan/images/walkthrough_screen_image_1.png",
      titleText: "Scan all your documents quickly and easily",
      bodyText: "Digitize paperwork in seconds with our high-speed scanning feature..."),
  Walkthrough(
      image: "images/proScan/images/walkthrough_screen_image_2.png",
      titleText: "You can also edit and customize scan results",
      bodyText: "Add a personal touch: Customize text, images, and more in your scanned documents..."),
  Walkthrough(
      image: "images/proScan/images/walkthrough_screen_image_3.png",
      titleText: "Organize your documents with ProScan now!",
      bodyText: "Effortlessly organize your documents for a more efficient and productive workflow..."),
];
