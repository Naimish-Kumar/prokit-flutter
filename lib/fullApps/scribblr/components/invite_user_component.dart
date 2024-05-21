import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../main.dart';
import '../utils/colors.dart';

import '../models/invite_user_model.dart';

class InviteUserComponent extends StatefulWidget {
  final InviteUserModel userModelData;
  final String selectedText;
  final String unselectedText;

  InviteUserComponent({required this.userModelData, required this.selectedText, required this.unselectedText});

  @override
  State<InviteUserComponent> createState() => _InviteUserComponentState();
}

class _InviteUserComponentState extends State<InviteUserComponent> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(color: context.scaffoldBackgroundColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(widget.userModelData.userImage.validate()), fit: BoxFit.cover),
            ),
          ),
          16.width,
          Text(
            widget.userModelData.userName.validate(),
            style: TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
          ).expand(),
          16.width,
          GestureDetector(
            onTap: () {
              setState(() {
                _isSelected = !_isSelected;
              });
            },
            child: Chip(
              side: BorderSide(style: BorderStyle.solid, color: scribblrPrimaryColor),
              label: Text(
                _isSelected ? widget.selectedText : widget.unselectedText,
                style: TextStyle(fontSize: 12, color: _isSelected ? scribblrPrimaryColor : Colors.white),
              ),
              backgroundColor: _isSelected ? context.scaffoldBackgroundColor : scribblrPrimaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          )
        ],
      ),
    );
  }
}
