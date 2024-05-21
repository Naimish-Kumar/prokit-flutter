import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prokit_flutter/fullApps/proScan/component/AppButton.dart';
import 'package:prokit_flutter/fullApps/proScan/component/text_form_field_label_text.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/constant.dart';

import '../../../main.dart';
import '../models/select_payment_screen_model.dart';
import '../utils/common.dart';
import '../utils/images.dart';

class AddNewPaymentScreen extends StatefulWidget {
  const AddNewPaymentScreen({Key? key}) : super(key: key);

  @override
  State<AddNewPaymentScreen> createState() => _AddNewPaymentScreenState();
}

class _AddNewPaymentScreenState extends State<AddNewPaymentScreen> {
  TextEditingController dateInput = TextEditingController();
  TextEditingController cardNumCont = TextEditingController();
  TextEditingController cardHolderNameCont = TextEditingController();
  bool format = false;

  late FocusNode f1;
  late FocusNode f2;

  @override
  void initState() {
    dateInput.text = "";
    f1 = FocusNode();
    f2 = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    f1.dispose();
    f2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Payment"),
        titleTextStyle: boldTextStyle(fontSize: 24),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 16, bottom: 80, right: 16, left: 16),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: proScanPrimaryColor, borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS)),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 24,
                        right: 24,
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(color: Colors.white30, shape: BoxShape.circle),
                        ),
                      ),
                      Positioned(
                        top: 24,
                        right: 44,
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                        ),
                      ),
                      Positioned(bottom: 16, right: 24, child: Image.asset(amazon_image_image, height: 60, color: Colors.white)),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16),
                            Text("Card", style: boldTextStyle(color: Colors.white, fontSize: 20)),
                            SizedBox(height: 24),
                            cardNumCont.text.length == 0
                                ? Text(".... .... .... ....", style: boldTextStyle(color: Colors.white, fontSize: 40))
                                : format == true
                                    ? Text(
                                        "${cardNumCont.text.substring(0, 4)} ${cardNumCont.text.substring(4, 8)} ${cardNumCont.text.substring(8, 12)} ${cardNumCont.text.substring(12, 16)}",
                                        style: boldTextStyle(color: Colors.white, fontSize: 24),
                                      )
                                    : Text(
                                        cardNumCont.text,
                                        style: boldTextStyle(color: Colors.white, fontSize: 24),
                                      ),
                            SizedBox(height: 32),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text("Card Holder Name", style: primaryTextStyle(fontSize: 12, color: Colors.white)),
                                    SizedBox(height: 8),
                                    cardHolderNameCont.text.length == 0 ? Text("********", style: primaryTextStyle(fontSize: 20, color: Colors.white)) : Text(cardHolderNameCont.text, style: primaryTextStyle(fontSize: 14, color: Colors.white)),
                                  ],
                                ),
                                SizedBox(width: 16),
                                Column(
                                  children: [
                                    Text("Expiry Date", style: primaryTextStyle(fontSize: 12, color: Colors.white)),
                                    SizedBox(height: 8),
                                    dateInput.text.length == 0 ? Text("00/00", style: primaryTextStyle(color: Colors.white)) : Text(dateInput.text, style: primaryTextStyle(color: Colors.white)),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Column(
                  children: [
                    TextFormFieldLabelText(text: "Card Holder Name"),
                    TextFormField(
                      focusNode: f1,
                      controller: cardHolderNameCont,
                      textInputAction: TextInputAction.next,
                      decoration: inputDecoration(hintText: "Enter Card Holder Name"),
                      onChanged: (value) {
                        setState(() {});
                      },
                      onFieldSubmitted: (value) {
                        f1.unfocus();
                        FocusScope.of(context).requestFocus(f2);
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormFieldLabelText(text: "Card Number"),
                    TextFormField(
                      focusNode: f2,
                      controller: cardNumCont,
                      maxLength: 16,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      decoration: inputDecoration(hintText: "Enter Card Number"),
                      onChanged: (value) {
                        if (cardNumCont.text.length != 16) {
                          format = false;
                        }
                        setState(() {});
                      },
                      onFieldSubmitted: (value) {
                        if (cardNumCont.text.length == 16) {
                          format = true;
                        }
                        f2.unfocus();
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormFieldLabelText(text: "Expiry date"),
                    TextFormField(
                      readOnly: true,
                      controller: dateInput,
                      decoration: inputDecoration(
                        hintText: "MM/YY",
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2101),
                            );
                            if (pickedDate != null) {
                              String formattedDate = DateFormat('MM/yy').format(pickedDate);
                              setState(
                                () {
                                  dateInput.text = formattedDate;
                                },
                              );
                            } else {
                              print("Date is not selected");
                            }
                          },
                          child: Icon(Icons.calendar_month_rounded, color: proScanPrimaryColor),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormFieldLabelText(text: "CVV"),
                    TextFormField(
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      decoration: inputDecoration(
                        hintText: "Enter Card CVV",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: AppButton(
              text: "Add",
              onTap: () {
                Navigator.pop(context);
                if (cardNumCont.text.length == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your Card is not saved")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your Card is Saved")));
                  return paymentOptions.add(paymentScreenOptions(".... .... .... ${cardNumCont.text.substring(cardNumCont.text.length - 4)}", master_card_image));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
