import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme15/components/dashbord_components/dashboard_card_component.dart';

import '../utils/T15common_widgets.dart';

class T15CardScreen extends StatelessWidget {
  const T15CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 16),
          Row(
            children: [
              16.width,
              backButton(context),
              Expanded(
                child: Text(
                  "Card Screen",
                  style: boldTextStyle(size: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              16.width
            ],
          ),
          SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              scrollDirection: Axis.vertical,
              child: Wrap(
                runSpacing: 16,
                children: List.generate(5, (index) => DashboardCardComponent()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
