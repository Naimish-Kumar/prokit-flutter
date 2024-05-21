import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../components/invite_user_component.dart';
import '../models/invite_user_model.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({super.key});

  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          surfaceTintColor: context.scaffoldBackgroundColor,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          backgroundColor: context.scaffoldBackgroundColor,
          bottom: TabBar(
            controller: _tabController,
            labelColor: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
            indicatorColor: Theme.of(context).primaryColor,
            tabs: [
              Tab(text: 'Following'),
              Tab(text: 'Followers'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              10.height,
              ...List.generate(
                getInviteUserModelList().length,
                (index) => InviteUserComponent(userModelData: getInviteUserModelList()[index], selectedText: 'Following', unselectedText: 'Follow').paddingSymmetric(vertical: 2),
              ),
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                10.height,
                ...List.generate(
                  getInviteUserModelList().length,
                  (index) => InviteUserComponent(userModelData: getInviteUserModelList()[index], selectedText: 'Following', unselectedText: 'Follow').paddingSymmetric(vertical: 2),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
