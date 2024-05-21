import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../main.dart';
import '../utils/colors.dart';
import '../utils/common.dart';
import 'text_styles.dart';

class DatePickerWidget extends StatefulWidget {
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: primarytextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
      controller: dateController,
      readOnly: true,
      decoration: inputDecoration(context,
          labelText: "DD/MM/YYYY", suffixIcon: Icon(Icons.date_range, color: scribblrPrimaryColor)),
      onTap: () async {
        var date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
                  primary: scribblrPrimaryColor,
                ),
              ),
              child: child!,
            );
          },
        );
        if (date != null) {
          // Add this check
          String formattedDate = DateFormat('dd-MM-yyyy').format(date);
          dateController.text = formattedDate;
        }
      },
    );
  }
}
