import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme15/components/elevatedbutton_component.dart';
import 'package:prokit_flutter/themes/theme15/utils/T15colors.dart';

import '../components/donate_screen_components/donation_screen_card_component.dart';
import '../components/pets_screen_components/pets_screen_appbar_components.dart';
import '../utils/T15comman.dart';

class DonateScreen extends StatefulWidget {
  DonateScreen({Key? key}) : super(key: key);

  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  List<bool> colorAt = [];

  int paymentNum = -1;
  int num = 0;
  String? paymentMethod;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 4; i++) {
      colorAt.add(false);
    }
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            PetsScreenAppbarComponents(
              title: "Donate",
              rightIconImage: "images/theme15/icons/two-dots.png",
            ),
            28.height,
            DonationScreenCardComponent(),
            16.height,
            Text(
              'Select Amount',
              style: boldTextStyle(size: 20),
            ),
            12.height,
            Wrap(
              runSpacing: 16,
              spacing: 16,
              children: List.generate(
                4,
                (index) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(14),
                    onTap: () {
                      num = index;
                      colorAt[index] = !colorAt[index];
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 26, horizontal: 24),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 2 - 24,
                      decoration: BoxDecoration(
                          color: colorAt[index] ? primarycolor : context.cardColor,
                          borderRadius: BorderRadius.circular(14)),
                      child: Text(
                        "\$ ${amount[index]}",
                        style: primaryTextStyle(size: 18),
                      ),
                    ),
                  );
                },
              ),
            ),
            28.height,
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                    endIndent: 8,
                  ),
                ),
                Text(
                  "Or",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    indent: 8,
                    thickness: 1,
                    height: 1,
                  ),
                ),
              ],
            ),
            12.height,
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: context.cardColor,
                filled: true,
                hintText: "Enter Amount Manually",
                hintStyle: secondaryTextStyle(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(style: BorderStyle.none, width: 0),
                ),
              ),
            ),
            28.height,
            Text(
              "Select Payment Method",
              style: boldTextStyle(size: 20),
            ),
            16.height,
            Wrap(
              direction: Axis.vertical,
              spacing: 16,
              children: List.generate(paymentOption.length, (index) {
                return GestureDetector(
                  onTap: () {
                    paymentMethod = paymentOptionName[index];
                    paymentNum = index;
                    setState(() {});
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 32,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: context.cardColor,
                    ),
                    child: Row(
                      children: [
                        Radio<dynamic>(
                          activeColor: primarycolor,
                          value: paymentOptionName[index],
                          groupValue: paymentMethod,
                          onChanged: (paymentMethod) {},
                        ),
                        Expanded(
                          child: Text(
                            paymentOption[index],
                            style: secondaryTextStyle(),
                          ),
                        ),
                        Image.asset(
                          paymentimages[index],
                          height: 25,
                          colorBlendMode: BlendMode.modulate,
                        ),
                        16.width
                      ],
                    ),
                  ),
                );
              }),
            ),
            28.height,
            ElevatedButtonComponent(text: "Pay & Confirm", toastText: 'Payment Done!'),
            16.height
          ],
        ),
      ),
    );
  }
}
