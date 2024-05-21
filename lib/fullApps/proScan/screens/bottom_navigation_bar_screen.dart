import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';

import '../utils/images.dart';
import '../utils/lists.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  BottomNavigationBarScreen({Key? key, required this.itemIndex}) : super(key: key);
  final int itemIndex;

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int selectedIndex = 0;

  void onTimeTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = widget.itemIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: navigationPages.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: proScanPrimaryColor,
        currentIndex: selectedIndex,
        iconSize: 26,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedItemColor: Colors.grey,
        elevation: 0,
        onTap: onTimeTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(home_outlined, height: 24, color: Colors.grey),
            activeIcon: Image.asset(home_filled, color: proScanPrimaryColor, height: 28),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(folder_outlined, height: 24, color: Colors.grey),
            activeIcon: Image.asset(folder_filled, color: proScanPrimaryColor, height: 28),
            label: "Files",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(star_outlined, height: 24, color: Colors.grey),
            activeIcon: Image.asset(star_filled, color: proScanPrimaryColor, height: 28),
            label: "Premium",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(user_outlined, height: 24, color: Colors.grey),
            activeIcon: Image.asset(user_filled, color: proScanPrimaryColor, height: 28),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
