import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main.dart';
import '../../components/text_styles.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../following_screen.dart';
import '../profile_articles.dart';
import '../settings_screen/personal_info.dart';

class ProfileFragment extends StatefulWidget {
  const ProfileFragment({super.key});

  @override
  State<ProfileFragment> createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildProfileRow(context),
            15.height,
            buildDivider(),
            buildStatsRow(),
            buildDivider(),
            15.height,
            buildAboutSection(),
            15.height,
            buildDivider(),
            10.height,
            buildSocialMediaSection(),
            15.height,
            buildDivider(),
            10.height,
            buildMoreInfoSection(),
          ],
        ),
      ),
    );
  }

  Row buildProfileRow(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(AuthorImage.authElina), fit: BoxFit.cover),
          ),
        ),
        16.width,
        Column(
          children: [
            Text('Elina',
                style:
                    TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor)),
            8.height,
            Text('@elina', style: secondarytextStyle()),
          ],
        ),
        Spacer(),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(context.scaffoldBackgroundColor),
            side: MaterialStateProperty.all(BorderSide(color: scribblrPrimaryColor)),
          ),
          onPressed: () {
            PersonalInfo().launch(context);
          },
          child: Row(
            children: [
              Icon(Icons.edit,
                  size: 14, color: appStore.isDarkModeOn ? scaffoldLightColor : scribblrPrimaryColor),
              Text('Edit',
                  style: TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scribblrPrimaryColor)),
            ],
          ),
        ),
      ],
    );
  }

  Divider buildDivider() {
    return Divider(thickness: appStore.isDarkModeOn ? 0.4 : 0.2, color: dividerDarkColor);
  }

  Row buildStatsRow() {
    return Row(
      children: [
        buildStatColumn('15', 'Articles'),
        buildVerticalDivider(),
        buildStatColumn('12', 'Followings'),
        buildVerticalDivider(),
        buildStatColumn('25', 'Followers'),
      ],
    );
  }

  Widget buildStatColumn(String number, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(number,
              style:
                  TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor)),
          GestureDetector(
            onTap: () {
              switch (label) {
                case 'Followings' || 'Followers':
                  FollowingScreen().launch(context);
                case 'Articles':
                  ProfileArticles().launch(context);
                  break;
              }
            },
            child: Text(label, style: TextStyle(color: scribblrPrimaryColor)),
          ),
        ],
      ),
    );
  }

  SizedBox buildVerticalDivider() {
    return SizedBox(
      height: 50,
      width: 5,
      child: VerticalDivider(thickness: appStore.isDarkModeOn ? 0.4 : 0.2, color: dividerDarkColor),
    );
  }

  Column buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style:
              primarytextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
        ),
        15.height,
        Text(
          'Description',
          style: TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
        ),
        10.height,
        Text(
          style: TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
          textAlign: TextAlign.justify,
          'Hey... I am a seasoned article and blog writer with over 5 years of experience in the industry.I specializes in creating engaging, SEO-friendly content that drives traffic and increases user engagement. My expertise lies in a wide range of topics, including technology, lifestyle, and travel. My work has been published on numerous high-profile platforms, demonstrating his ability to appeal to diverse audiences.',
        ),
      ],
    );
  }

  Column buildSocialMediaSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Social Media',
          style: TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
        ),
        10.height,
        buildSocialMediaRow(Ionicons.logo_whatsapp, 'WhatsApp'),
        10.height,
        buildSocialMediaRow(Ionicons.logo_facebook, 'Facebook'),
        10.height,
        buildSocialMediaRow(Ionicons.logo_instagram, 'Instagram'),
        10.height,
        buildSocialMediaRow(Ionicons.logo_twitter, 'Twitter'),
      ],
    );
  }

  Row buildSocialMediaRow(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: scribblrPrimaryColor, size: 20),
        5.width,
        Text(label, style: TextStyle(color: scribblrPrimaryColor)),
      ],
    );
  }

  Column buildMoreInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'More Info',
          style: TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
        ),
        10.height,
        buildInfoRow(Ionicons.globe_outline, 'Scribblr'),
        10.height,
        buildInfoRow(Ionicons.location_outline, 'New York,United States'),
        10.height,
        buildInfoRow(Ionicons.information_circle_outline, 'Joined Since March, 2024'),
      ],
    );
  }

  Row buildInfoRow(IconData icon, String info) {
    return Row(
      children: [
        Icon(icon),
        5.width,
        Text(info,
            style: TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor)),
      ],
    );
  }
}
