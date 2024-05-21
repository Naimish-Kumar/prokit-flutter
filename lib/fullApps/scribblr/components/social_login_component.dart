import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/colors.dart';

class CustomContainer extends StatelessWidget {
  final IconData iconData;
  final Color borderColor;
  final double borderWidth;

  CustomContainer({required this.iconData, required this.borderColor, required this.borderWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        shape: BoxShape.rectangle,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: Icon(iconData),
    ).expand();
  }
}

class ContinueWith extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomContainer(iconData: (Ionicons.logo_google), borderColor: quaternaryButtonColor, borderWidth: 1.3),
        20.width,
        CustomContainer(iconData: (Ionicons.logo_facebook), borderColor: quaternaryButtonColor, borderWidth: 1.3),
        20.width,
        CustomContainer(iconData: (Ionicons.logo_apple), borderColor: quaternaryButtonColor, borderWidth: 1.3),
      ],
    );
  }
}
