import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme15/components/elevatedbutton_component.dart';
import 'package:prokit_flutter/themes/theme15/components/filter_Screen_compnnents/filter_screen_appbar_component.dart';

import 'package:prokit_flutter/themes/theme15/components/filter_Screen_compnnents/filter_screen_pettype_button_component.dart';
import 'package:prokit_flutter/themes/theme15/utils/T15TextButton.dart';
import 'package:prokit_flutter/themes/theme15/utils/T15comman.dart';
import 'package:prokit_flutter/themes/theme15/utils/T15common_widgets.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String dropdownValue = 'Choose Breed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            FilterScreenAppbarComponent(text: "Filters"),
            28.height,
            TextField(
              decoration: InputDecoration(
                fillColor: context.cardColor,
                filled: true,
                hintText: "Select Location",
                prefixIcon: Icon(Icons.search_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(width: 0, style: BorderStyle.none),
                ),
              ),
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text("Pet Type", style: boldTextStyle(size: 18)),
                ),
                CommonTextButton(text: "See More")
              ],
            ),
            8.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterScreenPetTypeButtonComponents(text: "Dog"),
                FilterScreenPetTypeButtonComponents(text: "Cat"),
                FilterScreenPetTypeButtonComponents(text: "Chick"),
              ],
            ),
            16.height,
            DropdownButtonFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: context.cardColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none, width: 0),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              borderRadius: BorderRadius.circular(20),
              dropdownColor: Colors.blueGrey.shade50,
              value: dropdownValue,
              icon: Icon(Icons.keyboard_arrow_down, size: 30),
              style: secondaryTextStyle(),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: secondaryTextStyle(size: 16, color: Colors.grey),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
            ),
            24.height,
            titleRow("Sex"),
            12.height,
            Row(
              children: [
                FilterScreenPetTypeButtonComponents(text: "Male"),
                SizedBox(width: 16),
                FilterScreenPetTypeButtonComponents(text: "Female"),
              ],
            ),
            24.height,
            titleRow('Size'),
            12.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterScreenPetTypeButtonComponents(text: "Small"),
                FilterScreenPetTypeButtonComponents(text: "Medium"),
                FilterScreenPetTypeButtonComponents(text: "Large"),
              ],
            ),
            24.height,
            titleRow("Age"),
            12.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterScreenPetTypeButtonComponents(text: "Young"),
                FilterScreenPetTypeButtonComponents(text: "Adult"),
                FilterScreenPetTypeButtonComponents(text: "Senior"),
              ],
            ),
            24.height,
            ElevatedButtonComponent(
              text: "View Matches",
              toastText: 'See All matches',
            ),
          ],
        ),
      ),
    );
  }
}
