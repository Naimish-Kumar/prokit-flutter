import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

class CountryPickerWidget extends StatefulWidget {
  @override
  _CountryPickerWidgetState createState() => _CountryPickerWidgetState();
}

class _CountryPickerWidgetState extends State<CountryPickerWidget> {
  Country? _selectedCountry;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCountryPicker(
          context: context,
          exclude: <String>['KN', 'MF'],
          favorite: <String>['US'],
          showPhoneCode: false,
          onSelect: (Country country) {
            setState(() {
              _selectedCountry = country;
            });
          },
          countryListTheme: CountryListThemeData(
            textStyle:
                TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
            backgroundColor: appStore.isDarkModeOn ? Color(0xFF1F222A) : scaffoldLightColor,
            borderRadius: BorderRadius.circular(20),
            inputDecoration: InputDecoration(
              labelText: 'Search',
              labelStyle:
                  TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
              hintText: 'Select your Country',
              hintStyle:
                  TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: const Color(0xFF8C98A8).withOpacity(0.2))),
            ),
            searchTextStyle: TextStyle(
                color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor,
                fontSize: 18),
          ),
        );
      },
      child: Container(
        height: 70,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: appStore.isDarkModeOn ? Color(0xFF1F222A) : scaffoldLightColor,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            if (_selectedCountry != null)
              Text(_selectedCountry!.flagEmoji, style: TextStyle(fontSize: 16)),
            SizedBox(width: 10),
            Text(
              _selectedCountry?.name ?? 'Search Country',
              style: TextStyle(
                  fontSize: 16, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
