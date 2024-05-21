import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/screens/select_payment_screen.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/constant.dart';

import '../component/AppButton.dart';
import '../models/premium_screen_model.dart';
import '../utils/common.dart';
import '../utils/images.dart';
import '../utils/lists.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({Key? key}) : super(key: key);

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  PageController _pageCont = PageController(viewportFraction: 0.85);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Premium"),
        titleTextStyle: boldTextStyle(fontSize: 24),
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(12.0),
          child: Image.asset(splash_screen_image, color: proScanPrimaryColor),
        ),
        titleSpacing: 0,
      ),
      body: PageView.builder(
        itemCount: premiumOptionList.length,
        controller: _pageCont,
        onPageChanged: (value) {
          currentIndex = value;
          setState(() {});
        },
        itemBuilder: (context, int index) {
          return AnimatedContainer(
            margin: currentIndex == index ? EdgeInsets.all(8) : EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS),
              gradient: LinearGradient(
                stops: [0.1, 0.9],
                colors: premiumOptionList[index].color!,
              ),
            ),
            duration: Duration(milliseconds: 500),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: 24),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: " \$${premiumOptionList[index].amount.toString()}",
                      style: boldTextStyle(fontSize: 30, color: Colors.white),
                      children: [
                        TextSpan(text: "  / ${premiumOptionList[index].months} months", style: boldTextStyle(fontSize: 16, color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Go Premium, and enjoy the benefits",
                    textAlign: TextAlign.center,
                    style: primaryTextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  Divider(thickness: 2, color: Colors.white),
                  SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: premiumDetailsList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            children: [
                              Icon(
                                Icons.check_box_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  premiumDetailsList[index],
                                  overflow: TextOverflow.ellipsis,
                                  style: primaryTextStyle(fontSize: 14, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  AppButton(
                    text: "Select Plan",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectPaymentScreen(amount: premiumOptionList[index].amount.toString(), months: premiumOptionList[index].months.toString()),
                        ),
                      );
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
      ),

      //     Container(
      //   color: Colors.white,
      //   padding: EdgeInsets.symmetric(vertical: 8),
      //   child: Stack(
      //     children: [
      //       CarouselSlider(
      //         items: [PremiumScreen1(), PremiumScreen2(), PremiumScreen3()],
      //         options: CarouselOptions(
      //           height: MediaQuery.of(context).size.height,
      //           enlargeCenterPage: true,
      //           autoPlay: true,
      //           onPageChanged: (index, other) {
      //             setState(
      //               () {
      //                 _current = index;
      //               },
      //             );
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
