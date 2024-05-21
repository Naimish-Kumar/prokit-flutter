class AccountScreenOptions {
  String? image;
  String? title;
  String? trailingText;

  AccountScreenOptions(this.image, this.title, this.trailingText);
}

List<AccountScreenOptions> accountOptions = [
  AccountScreenOptions("images/proScan/icons/bottom_navigation_icons/user_outlined.png", "Personal Info", ""),
  AccountScreenOptions("images/proScan/images/setting.png", "Preferences", ""),
  AccountScreenOptions("images/proScan/images/security.png", "Security", ""),
  AccountScreenOptions("images/proScan/images/document.png", "Language", "English (US)"),
  AccountScreenOptions("images/proScan/images/view.png", "Dark Mode", ""),
];
List<AccountScreenOptions> aboutAppOptions = [
  AccountScreenOptions("images/proScan/images/document.png", "Help Center", ""),
  AccountScreenOptions("images/proScan/icons/info.png", "About ProScan", ""),
  AccountScreenOptions("images/proScan/icons/exit.png", "Logout", ""),
];
