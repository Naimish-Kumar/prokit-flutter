import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../components/app_scaffold.dart';
import '../../components/blur_dialog_widget.dart';
import '../../components/common_app_button.dart';
import '../../components/gradient_text_widget.dart';
import '../../components/icon_background_widget.dart';
import '../../utils/colors.dart';
import '../../utils/common.dart';
import '../../utils/images.dart';
import '../dashboard/dashboard_screen.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final interval = const Duration(seconds: 1);

  int timerMaxSeconds = 40;
  int currentSeconds = 0;
  String otpCode = '';

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    startTimeout();
  }

  void startTimeout([int? milliseconds]) {
    var duration = interval;
    _timer = Timer.periodic(duration, (timer) {
      setState(() {
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) {
          timer.cancel();
        }
      });
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      resizeToAvoidBottomInset: true,
      appBar: commonAppBarWidget(context, title: 'OTP Verification'),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 50),
            child: Column(
              children: [
                Text('Code has been send to (406) *****20', style: primaryTextStyle(color: whiteColor)),
                30.height,
                OTPTextField(
                  pinLength: 4,
                  fieldWidth: 70,
                  textStyle: primaryTextStyle(color: Colors.white),
                  onChanged: (s) {
                    otpCode = s;
                    log(otpCode);
                  },
                  onCompleted: (pin) {
                    otpCode = pin;
                  },
                ).fit(),
                30.height,
                Text(
                  'Resend code in ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}s',
                  style: primaryTextStyle(color: whiteColor),
                ).visible(!(currentSeconds == timerMaxSeconds)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Didn’t get the OTP?', style: secondaryTextStyle(color: whiteColor)),
                    TextButton(
                      onPressed: () {
                        startTimeout();
                      },
                      child: GradientTextWidget(text: 'Resend OTP'),
                    ),
                  ],
                ).visible(currentSeconds == timerMaxSeconds),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: CommonAppButton(
              btnText: 'Verify',
              onPressed: () async {
                FocusScope.of(context).unfocus();
                hideKeyboard(context);
                _timer.cancel();
                showDialog(
                  context: context,
                  builder: (context) {
                    return BlurDialogWidget(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconBackgroundWidget(icon: ic_shield),
                          20.height,
                          Text('Congr atulations!', style: boldTextStyle(color: whiteColor)),
                          10.height,
                          Text('Your account is ready to use. You will be redirected to the home page in a few seconds.', style: secondaryTextStyle(), textAlign: TextAlign.center),
                          30.height,
                          SpinKitCircle(color: loaderColor, duration: Duration(seconds: 2)),
                        ],
                      ),
                    );
                  },
                );
                await 1.seconds.delay;
                finish(context);
                finish(context);
                DashBoardScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
              },
            ),
          ),
        ],
      ),
    );
  }
}
