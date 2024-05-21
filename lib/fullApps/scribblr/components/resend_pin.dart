import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../utils/colors.dart';


class ResendPin extends StatefulWidget {
  @override
  _ResendPinState createState() => _ResendPinState();
}

class _ResendPinState extends State<ResendPin> {
  int _start = 30;
  bool _enableResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _enableResend = true;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            'You can resend code in $_start seconds',
            style: TextStyle(color: appStore.isDarkModeOn ? scaffoldLightColor : scaffoldDarkColor),
          ),
          TextButton(
            onPressed: _enableResend
                ? () {
                    setState(() {
                      _start = 30;
                      _enableResend = false;
                    });
                    startTimer();
                  }
                : null,
            child: Text('Resend code', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: scribblrPrimaryColor)),
          ),
        ],
      ),
    );
  }
}
