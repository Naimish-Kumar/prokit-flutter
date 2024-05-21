import '../screens/about_screen.dart';
import '../screens/account_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/files_screen.dart';
import '../screens/help_center_screen.dart';
import '../screens/language_screen.dart';
import '../screens/personal_info_screen.dart';
import '../screens/prefrances_screen.dart';
import '../screens/premium_screen.dart';
import '../screens/security_screen.dart';

List signInOptionImage = [
  "images/proScan/images/sign_in_screen_images/google.png",
  "images/proScan/images/sign_in_screen_images/apple.png",
  "images/proScan/images/sign_in_screen_images/facebook.png",
];
List signInOptions = [
  "Continue with Google",
  "Continue with Apple",
  "Continue with Facebook",
];
List<String> genders = ['Male', 'Female', 'Other'];
List navigationPages = [
  DashBoardScreen(),
  FilesScreen(),
  PremiumScreen(),
  AccountScreen(),
];
List selectedFilesList = [];
List searchList = [
  "Job Application Letter",
  "Requirements Documents",
  "Recommendation Letter",
  "Business Plan Proposal",
  "Legal & Terms of Reference",
  "Software Requirements",
  "Delayed Job Application Letter",
  "Delayed Requirements Documents",
  "My National ID Card",
];
List premiumDetailsList = ["Unlimited Documents", "Remove Ads", "Remove Watermark", "Export to Word, Excel, & PowerPoint", "HD Resolution", "Recognize Text (OCR)", "Collage", "Translation", "25GB Cloud Storage Space"];
List accountScreenInfoRouteList = [PersonalInfoScreen(), PreferencesScreen(), SecurityScreen(), LanguageScreen()];
List accountScreenHelpRoutList = [HelpCenterScreen(), AboutScreen()];
List<String> faqScreenOptions = ["General", "Account", "Service", "Scan"];
List suggestedList = [
  "English (US)",
  "English (UK)",
];
List languageList = [
  "Mandarin",
  "Spanish",
  "French",
  "Arabic",
  "Bengali",
  "Russian",
  "Japanese",
  "Korean",
  "Indonesia",
];
List aboutScreenList = [
  "Job Vacancy",
  "Developer",
  "Partner",
  "Accessibility",
  "Privacy Policy",
  "Feedback",
  "Rate us",
  "Visit Our Website",
  "Follow us on Social Media",
];
