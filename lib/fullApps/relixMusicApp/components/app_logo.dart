import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/images.dart';

class AppLogo extends StatelessWidget {
  final double? size;

  AppLogo({this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(app_logo, height: size ?? 100, width: size ?? 100).center(),
      ],
    );
  }
}
