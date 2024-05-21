import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/flixv2/screen/subscription_screens/add_card_screen.dart';
import 'package:prokit_flutter/fullApps/flixv2/screen/subscription_screens/ordersummary_screen.dart';
import 'package:prokit_flutter/fullApps/flixv2/utils/common_widgets.dart';
import 'package:prokit_flutter/fullApps/flixv2/utils/constants.dart';

class PaymentMethodsScreen extends StatefulWidget {
  String? premiumPlan;
  int? planIndex;

  PaymentMethodsScreen({this.premiumPlan, this.planIndex});

  State<PaymentMethodsScreen> createState() => PaymentMethodsScreenState();
}

class PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  int currentIndex = 0;
  bool validated = false;
  String? durationOfPemium;
  List<String> cards = [MASTERCARD_LOGO, VISA_LOGO];
  List<String> cardNames = ['Mastercard', 'Visa'];
  List<String> cardNumber = [
    '5118 **** **** 4519 ',
    '4519 **** **** 1289',
  ];

  void initState() {
    super.initState();
    if (widget.planIndex == 0) {
      durationOfPemium = '1 Month';
    } else {
      durationOfPemium = '1 Year';
    }
  }

  void dispose() {
    super.dispose();
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Wrap(
                  spacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.vertical,
                  children: [
                    Text(
                      'Payment Methods',
                      style: boldTextStyle(size: 22),
                    ),
                    Text(
                      'Select one of the following payment methods',
                      style: secondaryTextStyle(),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Wrap(
                  runSpacing: 16,
                  children: List.generate(cardNames.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        currentIndex = index;
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          builder: (context) {
                            return OrderSummaryScreen(
                              plan: widget.premiumPlan,
                              planIndex: widget.planIndex,
                            );
                          },
                        );
                        setState(() {});
                      },
                      child: AvailableCard(index),
                    );
                  }),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14))),
                  builder: (context) {
                    return Container(child: AddCardScreen());
                  },
                );
              },
              child: redirectionButtonContainer(
                width: MediaQuery.of(context).size.width - 32,
                title: 'Add Cards',
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget AvailableCard(index) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width - 32,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: BorderRadius.circular(defaultRadius),
        border: Border.all(
          width: currentIndex == index ? 2 : 0,
          color: currentIndex == index ? Colors.red.shade600 : Colors.transparent,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(defaultRadius),
            child: Image.asset(
              cards[index],
              fit: BoxFit.contain,
              width: 64,
              height: 64,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Wrap(
              direction: Axis.vertical,
              spacing: 8,
              children: [
                Text(cardNames[index], style: primaryTextStyle()),
                Text(
                  cardNumber[index],
                  style: secondaryTextStyle(),
                )
              ],
            ),
          ),
          SizedBox(width: 16),
          Icon(Icons.arrow_forward_ios_rounded, size: 18, color: Colors.grey.shade500),
        ],
      ),
    );
  }
}
