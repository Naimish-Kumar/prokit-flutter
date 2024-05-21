import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/flixv2/model/startwith_model.dart';
import 'package:prokit_flutter/fullApps/flixv2/screen/authentication_screen/signup_screen.dart';

class StartWithScreen extends StatefulWidget {
  State<StartWithScreen> createState() => StartWithScreenState();
}

class StartWithScreenState extends State<StartWithScreen> {
  int currentIndex = 0;
  List<StartwithModel> startWith = getStartWithList();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: List.generate(startWith.length, (index) {
        return GestureDetector(
          onTap: () {
            currentIndex = index;
            setState(() {});
            SignUpScreen(
              title: startWith[index].title,
              isEmail: index == 1,
            ).launch(context);
          },
          child: StartWithComponent(startWith[index], index),
        );
      }),
    );
  }

  Widget StartWithComponent(StartwithModel element, int index) {
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
            width: currentIndex == index ? 0 : 1, color: currentIndex == index ? Colors.white70 : Colors.grey.shade700),
        color: currentIndex == index ? Colors.red : context.cardColor,
      ),
      child: Row(
        children: [
          Icon(
            element.leadingIcon,
            size: 22,
            color: currentIndex == index ? Colors.grey.shade200 : Colors.grey.shade500,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(element.title!,
                    style: boldTextStyle(color: currentIndex == index ? Colors.white : Colors.grey.shade500)),
                SizedBox(height: 4),
                Text(element.subtitle!,
                    style: secondaryTextStyle(
                        size: 14, color: currentIndex == index ? Colors.grey.shade200 : Colors.grey.shade500)),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: currentIndex == index ? Colors.grey.shade200 : Colors.grey.shade500,
          ),
        ],
      ),
    );
  }
}
