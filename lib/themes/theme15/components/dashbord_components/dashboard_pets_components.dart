import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/T15colors.dart';
import '../../utils/T15model.dart';

class DashboardPetsComponents extends StatefulWidget {
  const DashboardPetsComponents({Key? key}) : super(key: key);

  @override
  State<DashboardPetsComponents> createState() => _DashboardPetsComponentsState();
}

class _DashboardPetsComponentsState extends State<DashboardPetsComponents> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      children: List.generate(
        petsModelList.length,
        (index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(16),
              width: 220,
              decoration: BoxDecoration(
                color: context.cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: petsModelList[index].backgroundcolor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset(
                          petsModelList[index].imagePath,
                          //"images/theme15/dashboard/d3.png",
                          height: 150,
                        ),
                      ),
                    ),
                  ),
                  12.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            petsModelList[index].username,
                            style: boldTextStyle(),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "images/theme15/icons/location1.png",
                                height: 13,
                                width: 13,
                                color: primarycolor,
                              ),
                              SizedBox(width: 4),
                              Text(
                                petsModelList[index].location,
                                style: secondaryTextStyle(),
                              )
                            ],
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          petsModelList[index].isSelected = !petsModelList[index].isSelected;
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: context.cardColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12, blurRadius: 0.5, spreadRadius: 0.1, offset: Offset(1, 1)),
                              BoxShadow(
                                  color: Colors.black12, blurRadius: 0.5, spreadRadius: 0.1, offset: Offset(0, 1)),
                            ],
                          ),
                          child: petsModelList[index].isSelected
                              ? Image.asset(
                                  "images/theme15/icons/heart.png",
                                  height: 24,
                                  width: 24,
                                  color: tertiarycolor,
                                )
                              : Icon(
                                  Icons.favorite_border_rounded,
                                  color: Colors.red,
                                ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
