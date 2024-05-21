import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/T15colors.dart';

class DonationScreenCardComponent extends StatelessWidget {
  const DonationScreenCardComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            padding: EdgeInsets.only(left: 25, right: 16, bottom: 16, top: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: secondarycolor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(
              "images/theme15/pets_images/dog8.png",
              height: 60,
              width: 60,
            ),
          ),
          16.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rocky",
                style: boldTextStyle(size: 18),
              ),
              8.height,
              Row(
                children: [
                  Image.asset(
                    "images/theme15/icons/location1.png",
                    height: 15,
                    width: 15,
                    color: primarycolor,
                  ),
                  8.width,
                  Text(
                    "Chicago,(15KM)",
                    style: secondaryTextStyle(),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
