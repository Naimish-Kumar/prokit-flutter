import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/flixv2/model/profile_model.dart';
import 'package:prokit_flutter/fullApps/flixv2/screen/authentication_screen/change_password_screen.dart';
import 'package:prokit_flutter/fullApps/flixv2/screen/authentication_screen/logout_screen.dart';
import 'package:prokit_flutter/fullApps/flixv2/screen/history_screen.dart';
import 'package:prokit_flutter/fullApps/flixv2/screen/setting_screen.dart';
import 'package:prokit_flutter/fullApps/flixv2/screen/subscription_screens/subscription_plan_screen.dart';
import 'package:prokit_flutter/fullApps/flixv2/utils/common_widgets.dart';

class ProfileScreen extends StatefulWidget {
  PageController? pageController;
  int? currentIndex;

  ProfileScreen({this.pageController, this.currentIndex});

  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  FocusNode nameNode = FocusNode();
  TextEditingController nameController = TextEditingController(text: "Name");
  bool edit = false;
  List<ProfileModel> profileActivityItems = getActivityItems();
  List<ProfileModel> profileAccountItems = getAccountItems();
  List redirectTo = [SettingScreen(), SubScriptionPlanScreen(), ChangePasswordScreen(), LogoutScreen()];

  void initState() {
    nameController = TextEditingController();
    super.initState();
  }

  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(isLeading: false, title: 'Profile'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(16),
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            alignment: Alignment.center,
                            title: Text(
                              'Change Profile',
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Remove Profile',
                                  style: secondaryTextStyle(),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text('Change Profile', style: secondaryTextStyle(color: Colors.red)),
                              ),
                            ],
                          );
                        });
                  },
                  child: Container(
                    padding: EdgeInsets.all(48),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black12),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              edit = !edit;
                              FocusScope.of(context).requestFocus(nameNode);
                              nameController = TextEditingController();
                              setState(() {});
                            },
                            child: Text(
                              'Name',
                              style: primaryTextStyle(size: 18),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              edit = !edit;
                              setState(() {});
                            },
                            child: Icon(Icons.edit),
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        '@username',
                        style: secondaryTextStyle(),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 28,
                        width: 90,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.amber.shade700,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: GestureDetector(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 4,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.black,
                                size: 18,
                              ),
                              Text(
                                'Premium',
                                style: boldTextStyle(size: 12, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your Activities', style: boldTextStyle(size: 22)),
                SizedBox(height: 16),
                Wrap(
                  runSpacing: 16,
                  children: List.generate(
                    profileActivityItems.length,
                    (index) => InkWell(
                      onTap: () {
                        index == 2
                            ? Navigator.of(context).push(MaterialPageRoute(builder: (context) => HistoryScreen()))
                            : null;
                      },
                      borderRadius: BorderRadius.circular(defaultRadius),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: context.cardColor,
                          borderRadius: BorderRadius.circular(defaultRadius),
                        ),
                        child: activityItems(index),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                Text('Account', style: boldTextStyle(size: 22)),
                SizedBox(height: 16),
                Wrap(
                  runSpacing: 16,
                  children: List.generate(
                    profileAccountItems.length,
                    (index) => InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => redirectTo[index]));
                      },
                      child: Container(
                        padding: EdgeInsets.all(14),
                        decoration:
                            BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.circular(defaultRadius)),
                        child: accountItems(index),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget activityItems(int index) {
    ProfileModel data = profileActivityItems[index];
    return Row(
      children: [
        Icon(data.leadingWidget, color: Colors.grey.shade700),
        SizedBox(width: 16),
        Expanded(child: Text(data.title!, style: primaryTextStyle())),
        data.trailingWidget!
      ],
    );
  }

  Widget accountItems(int index) {
    ProfileModel data = profileAccountItems[index];
    return Row(
      children: [
        Icon(data.leadingWidget, color: Colors.grey.shade700),
        SizedBox(width: 16),
        Expanded(child: Text(data.title!, style: primaryTextStyle())),
        data.trailingWidget!
      ],
    );
  }
}
