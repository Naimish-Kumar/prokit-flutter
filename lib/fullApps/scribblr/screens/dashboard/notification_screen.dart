import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/scribblr/utils/colors.dart';
import '../../../../main.dart';
import '../../components/gen_notification_component.dart';
import '../../components/sys_notification_component.dart';
import '../../components/text_styles.dart';
import '../../models/gen_notification_res_model.dart';
import '../../models/sys_notification_res_model.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
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
          iconTheme:
              IconThemeData(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
          backgroundColor: context.scaffoldBackgroundColor,
          title: Text('Notifications',
              style: primarytextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
          bottom: TabBar(
            controller: _tabController,
            labelColor: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
            indicatorColor: scribblrPrimaryColor,
            tabs: [
              Tab(text: 'General'),
              Tab(text: 'System'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              10.height,
              ...List.generate(
                getGenNotificationModelList().length,
                (index) => GenNotificationComponent(
                  genNotificationData: getGenNotificationModelList()[index],
                ).paddingSymmetric(vertical: 4),
              ),
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                10.height,
                ...List.generate(
                  getSysNotificationModelList().length,
                  (index) => SysNotificationComponent(
                    sysNotificationData: getSysNotificationModelList()[index],
                  ).paddingSymmetric(vertical: 4),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
}
