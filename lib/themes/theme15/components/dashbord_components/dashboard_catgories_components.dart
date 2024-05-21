import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main.dart';
import '../../utils/T15colors.dart';
import '../../utils/T15comman.dart';
import '../../utils/T15images.dart';

class DashboardCatgoriesComponents extends StatefulWidget {
  DashboardCatgoriesComponents({Key? key}) : super(key: key);

  @override
  State<DashboardCatgoriesComponents> createState() => _DashboardCatgoriesComponentsState();
}

class _DashboardCatgoriesComponentsState extends State<DashboardCatgoriesComponents> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Wrap(
        spacing: 16,
        children: List.generate(catgoriesimages.length, (index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              setState(() {});
            },
            child: Container(
              padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 20),
              decoration: BoxDecoration(
                color: currentIndex == index ? primarycolor : context.cardColor,
                borderRadius: BorderRadius.all(Radius.circular(45)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIndex == index
                          ? Colors.white
                          : (appStore.isDarkModeOn ? Colors.grey.shade600 : Colors.black12),
                      image: DecorationImage(image: AssetImage(catgoriesimages[index])),
                    ),
                  ),
                  20.height,
                  Text(
                    catgories[index],
                    style: primaryTextStyle(color: currentIndex == index ? white : textSecondaryColorGlobal),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
