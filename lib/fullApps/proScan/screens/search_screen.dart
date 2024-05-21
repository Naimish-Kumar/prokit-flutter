import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/models/dashboard_model_class.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/common.dart';

import '../../../main.dart';
import '../utils/images.dart';
import '../utils/lists.dart';
import 'account_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final bool focusColor = true;
  TextEditingController searchCont = TextEditingController();
  bool searchResult = false;
  bool backgroundColor = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 16),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                ),
                Expanded(
                  child: TextFormField(
                    controller: searchCont,
                    cursorColor: proScanPrimaryColor,
                    onTap: () {
                      backgroundColor = true;
                      setState(() {});
                    },
                    decoration: inputDecoration(
                      hintText: "Search",
                      filled: true,
                      fillColor: appStore.isDarkModeOn
                          ? backgroundColor
                              ? Color(0xFF1c2031)
                              : proScanDarkPrimaryLightColor
                          : backgroundColor
                              ? proScanPrimaryLightColor
                              : Colors.grey.shade200,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          searchCont.text = searchCont.text.replaceAll(searchCont.text, "");
                          setState(() {});
                        },
                        child: Icon(
                          Icons.close,
                          color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Image.asset(
                          search_image,
                          height: 20,
                          width: 20,
                          color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: proScanPrimaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(style: BorderStyle.none),
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      backgroundColor = false;
                      if (searchCont.text.isNotEmpty) {
                        return searchList.add(searchCont.text);
                      }
                      setState(() {});
                    },
                    onChanged: (value) {
                      if (searchCont.text.length != 0) {
                        if (dashboardFilesList.first.titleText!.contains(searchCont.text)) {
                          searchResult == true;
                        }
                        setState(() {});
                      }
                    },
                  ),
                ),
                SizedBox(width: 16)
              ],
            ),
            SizedBox(height: 16),
            searchCont.text.length == 0
                ? searchList.length == 0
                    ? Offstage()
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Previous Search",
                                  style: boldTextStyle(fontSize: 18),
                                ),
                                TextButton(
                                  onPressed: () {
                                    searchList.clear();
                                    setState(() {});
                                  },
                                  child: Text(
                                    "Clear All",
                                    style: boldTextStyle(fontSize: 18, color: proScanPrimaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          SizedBox(height: 8),
                          ListView.builder(
                            itemCount: searchList.length,
                            primary: false,
                            padding: EdgeInsets.only(bottom: 16),
                            shrinkWrap: true,
                            reverse: true,
                            itemBuilder: (context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 16, right: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      searchList[index],
                                      style: secondaryTextStyle(fontSize: 18),
                                      overflow: TextOverflow.fade,
                                    ),
                                    IconButton(
                                      splashRadius: 24,
                                      onPressed: () {
                                        searchList.removeAt(index);
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        ],
                      )
                : searchResult
                    ?

                    /// if data found
                    Text("Data found", style: boldTextStyle())

                    /// end
                    : Column(
                        children: [
                          Image.asset(
                            "images/proScan/images/no_result.png",
                            width: width * 1,
                            height: height * 0.5,
                          ),
                          Text("Not Found", style: boldTextStyle(fontSize: 24)),
                          SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "We're sorry, the keyword you were looking for could not be found. Please search with another keywords.",
                              style: primaryTextStyle(),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
          ],
        ),
      ),
    );
  }
}
