import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/flixv2/screen/dashboard_screens/dashboard_screen.dart';
import 'package:prokit_flutter/fullApps/flixv2/utils/common_widgets.dart';

class PaymentStatusScreen extends StatefulWidget {
  String? status;

  PaymentStatusScreen({this.status});

  State<PaymentStatusScreen> createState() => PaymentStatusScreenState();
}

class PaymentStatusScreenState extends State<PaymentStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        isLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.close,
            size: 28,
            color: Colors.grey.shade400,
          ),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Text('Payment ${widget.status}', style: boldTextStyle(size: 22)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Your Premium Plan has been completed\n',
                            style: secondaryTextStyle(size: 18),
                          ),
                          TextSpan(
                            text: 'succesfully and your',
                            style: secondaryTextStyle(size: 18),
                            children: [
                              TextSpan(
                                text: ' Premium Plan',
                                style: boldTextStyle(size: 18, color: Colors.yellow.shade800),
                              ),
                              TextSpan(text: ' is now \nactivated')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DashboardScreen()));
              },
              child: redirectionButtonContainer(title: 'Back to Home', width: MediaQuery.of(context).size.width - 256),
            )
          ],
        ),
      ),
    );
  }
}
