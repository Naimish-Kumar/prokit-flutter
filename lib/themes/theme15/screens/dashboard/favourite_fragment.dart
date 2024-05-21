import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class FavouriteFragment extends StatelessWidget {
  const FavouriteFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Favourite Screen", style: boldTextStyle(size: 24)),
      ),
    );
  }
}
