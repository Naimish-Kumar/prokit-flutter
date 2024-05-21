import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/Component/CheckOutComponent.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class PayStackScreen extends StatefulWidget {
  @override
  PayStackScreenState createState() => PayStackScreenState();
}

class PayStackScreenState extends State<PayStackScreen> {
  String publicKey = '<PLACE_YOUR_PUBLIC_KEY>';
  final plugin = PaystackPlugin();
  String message = '';

  @override
  void initState() {
    super.initState();

    plugin.initialize(publicKey: publicKey);
    afterBuildCreated(() {
      setStatusBarColor(Colors.transparent);
    });
  }

  void makePayment() async {
    int price = int.parse('500') * 100;
    Charge charge = Charge()
      ..amount = price
      ..reference = 'ref_${DateTime.now().millisecondsSinceEpoch}'
      ..email = 'test@gmail.com'
      ..currency = 'NGN';

    CheckoutResponse response = await plugin.checkout(
      context,
      method: CheckoutMethod.card,
      charge: charge,
    );

    payStackUpdateStatus(response.reference, response.message);
    log(response.message);
    if (response.message == "Success") {
      snackBar(context, title: 'Payment was successful. Ref: ${response.reference}');
    } else {
      print('payment fail');
    }
  }

  void payStackUpdateStatus(String? reference, String message) {
    payStackShowMessage(message, const Duration(seconds: 7));
  }

  void payStackShowMessage(String message, [Duration duration = const Duration(seconds: 4)]) {
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.cardColor,
      appBar: appBar(context, 'PayStack Checkout'),
      body: SingleChildScrollView(
        child: CheckOutComponent(
          currency: 'NGN',
          cardNetwork: 'Visa',
          cartNumber: '4084 0840 8408 4081',
          cardCVV: '408',
          expiryDate: 'Any future date',
          warning: 'Supported Country Ghana, Nigeria, South Africa',
        ),
      ),
      bottomNavigationBar: AppButton(
        width: context.width(),
        text: 'Pay with PayStack',
        textColor: Colors.white,
        textStyle: boldTextStyle(color: white),
        color: appColorPrimary,
        onTap: () {
          makePayment();
        },
      ).paddingAll(16),
    );
  }
}
