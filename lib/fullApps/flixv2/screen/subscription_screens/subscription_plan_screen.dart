import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/flixv2/screen/subscription_screens/payment_methods_screen.dart';
import 'package:prokit_flutter/fullApps/flixv2/utils/common_widgets.dart';
import 'package:prokit_flutter/fullApps/flixv2/utils/constants.dart';

class SubScriptionPlanScreen extends StatefulWidget {
  State<SubScriptionPlanScreen> createState() => SubScriptionPlanScreenState();
}

class SubScriptionPlanScreenState extends State<SubScriptionPlanScreen> {
  int currentIndex = 0;
  late ScrollController sc;
  List<String> subscriptionPlan = ['\$8.99/Month', '\$89.99/Year'];

  List<String> benefitsOfPremiumTitle = ['High Quality', 'Watch Offline', 'Ad-Free Streaming'];
  List<String> benefitsOfPremiumSubtitle = [
    'Watch videos in 4k quality',
    'Download videos and watch later',
    'Enjoy watching videos without Ad-Free'
  ];

  void initState() {
    super.initState();
    sc = ScrollController(initialScrollOffset: 0.0);
  }

  void dispose() {
    sc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        isLeading: true,
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        controller: sc,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Subscribe to Premium Plan',
                  style: boldTextStyle(size: 22),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Select one of the following premium plans for unlimited access to all videos, then press the continue button',
                        style: secondaryTextStyle(size: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Wrap(
                  runSpacing: 32,
                  children: List.generate(subscriptionPlan.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        currentIndex = index;
                        sc.animateTo(MediaQuery.of(context).size.height,
                            duration: Duration(milliseconds: 100), curve: Curves.linear);
                        setState(() {});
                      },
                      child: premiumComponent(index),
                    );
                  }),
                )
              ],
            ),
            SizedBox(
              height: 32,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PaymentMethodsScreen(
                      planIndex: currentIndex,
                      premiumPlan: subscriptionPlan[currentIndex],
                    ),
                  ),
                );
              },
              child: redirectionButtonContainer(title: 'Continue', width: MediaQuery.of(context).size.width - 32),
            )
          ],
        ),
      ),
    );
  }

  Widget premiumComponent(index) {
    return Container(
      width: MediaQuery.of(context).size.width - 120,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: currentIndex == index ? 2 : 0,
          color: currentIndex == index ? Colors.red.shade600 : Colors.transparent,
        ),
        color: context.cardColor,
      ),
      child: Column(
        children: [
          Wrap(
            runSpacing: 4,
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.vertical,
            children: [
              ImageIcon(
                AssetImage(
                  PREMIUM_LOGO,
                ),
                size: 46,
                color: index == 0 ? Colors.red : Colors.amber.shade600,
              ),
              Text(
                'Premium',
                style: boldTextStyle(size: 20),
              ),
              Text(
                index == 0 ? "\$8.99/Month" : "\$89.99/Month",
                style: secondaryTextStyle(size: 12),
              ),
            ],
          ),
          SizedBox(height: 16),
          Wrap(
            runSpacing: 16,
            children: List.generate(benefitsOfPremiumTitle.length, (i) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check,
                    size: 20,
                    color: index == 0 ? Colors.red : Colors.amber.shade600,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(benefitsOfPremiumTitle[i], style: primaryTextStyle(size: 14)),
                        SizedBox(height: 4),
                        Text(
                          benefitsOfPremiumSubtitle[i],
                          style: secondaryTextStyle(size: 12),
                        )
                      ],
                    ),
                  )
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}
