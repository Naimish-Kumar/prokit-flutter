import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/services.dart';
import 'package:prokit_flutter/fullApps/flixv2/screen/subscription_screens/scancard_screen.dart';
import 'package:prokit_flutter/fullApps/flixv2/utils/common_widgets.dart';

class AddCardScreen extends StatefulWidget {
  State<AddCardScreen> createState() => AddCardScreenState();
}

class AddCardScreenState extends State<AddCardScreen> {
  var check = true;
  var visible = false;
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiredateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  List<TextEditingController> textEditingControllers = [];
  FocusNode cardFocus = FocusNode();
  FocusNode expiredateFocus = FocusNode();
  FocusNode cvvFocus = FocusNode();

  void initState() {
    super.initState();
    textEditingControllers.add(cardNumberController);
    textEditingControllers.add(expiredateController);
    textEditingControllers.add(cvvController);
  }

  void dispose() {
    cardNumberController.dispose();
    expiredateController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            height: 6,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade600,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Add Card',
            style: boldTextStyle(size: 18),
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 8,
            direction: Axis.vertical,
            children: [
              Text('Card Number', style: primaryTextStyle()),
              TextFormField(
                controller: cardNumberController,
                focusNode: cardFocus,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  constraints: textFormFieldBoxConstraints(
                    maxHeight: 60,
                    maxWidth: MediaQuery.of(context).size.width - 32,
                  ),
                  hintText: '',
                  prefixIcon: Icon(
                    Icons.credit_card_rounded,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ScanCard(),
                        ),
                      );
                    },
                    icon: Icon(Icons.document_scanner_rounded),
                  ),
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(16),
                  FilteringTextInputFormatter.singleLineFormatter,
                ],
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(expiredateFocus);
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 32,
            children: [
              Wrap(
                direction: Axis.vertical,
                spacing: 8,
                children: [
                  Text(
                    'Expire Date',
                    style: primaryTextStyle(),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.datetime,
                    controller: expiredateController,
                    textInputAction: TextInputAction.next,
                    cursorHeight: 28,
                    decoration: InputDecoration(
                        constraints: textFormFieldBoxConstraints(
                            maxHeight: 60, maxWidth: MediaQuery.of(context).size.width / 2 - 32)),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                    ],
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(cvvFocus);
                    },
                  ),
                ],
              ),
              Wrap(
                direction: Axis.vertical,
                spacing: 8,
                children: [
                  Text(
                    'CVV',
                    style: primaryTextStyle(),
                  ),
                  TextFormField(
                    cursorHeight: 28,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    controller: cvvController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      constraints: textFormFieldBoxConstraints(
                          maxHeight: 60, maxWidth: MediaQuery.of(context).size.width / 2 - 32),
                    ),
                    inputFormatters: [LengthLimitingTextInputFormatter(3), FilteringTextInputFormatter.digitsOnly],
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 8),
          Wrap(
            direction: Axis.vertical,
            children: [
              Row(
                children: [
                  Transform.scale(
                    child: Checkbox(
                      value: check,
                      fillColor: MaterialStatePropertyAll(Colors.red),
                      onChanged: (value) {
                        check = !check;
                        setState(() {});
                      },
                    ),
                    scale: 1.2,
                  ),
                  Text(
                    'Set as Default',
                    textAlign: TextAlign.left,
                    style: primaryTextStyle(),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: context.cardColor,
                      duration: Duration(milliseconds: 1200),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      )),
                      content: Text(
                        'Added Card Successfully!',
                        style: primaryTextStyle(),
                      ),
                      action: SnackBarAction(
                        label: 'Dismiss',
                        textColor: Colors.red,
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ),
                  );
                  Navigator.pop(context);
                },
                child: redirectionButtonContainer(
                  width: MediaQuery.of(context).size.width - 32,
                  title: 'Add Cards',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
