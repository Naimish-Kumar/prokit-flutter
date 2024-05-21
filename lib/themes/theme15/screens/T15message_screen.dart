import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme15/components/pets_screen_components/pets_screen_appbar_components.dart';
import 'package:prokit_flutter/themes/theme15/utils/T15common_widgets.dart';

import '../utils/T15colors.dart';
import '../utils/T15comman.dart';
import '../utils/T15images.dart';
import '../utils/T15model.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 8),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.cardColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  PetsScreenAppbarComponents(
                    title: "Messages",
                    rightIconImage: "images/theme15/icons/two-dots.png",
                  ),
                  20.height,
                  textField(
                      textEditingController: TextEditingController(),
                      focusNode: FocusNode(),
                      hintText: 'Search',
                      borderRadius: 30,
                      boxConstraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 32)),
                  8.height
                ],
              ),
            ),
            8.height,
            SingleChildScrollView(
              padding: EdgeInsets.all(16),
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 16,
                children: List.generate(dogImages.length, (index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: context.cardColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: primarycolor, width: 2),
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: index == 0
                              ? Image.asset("images/theme15/icons/plus.png", height: 25, width: 25, color: primarycolor)
                              : Image.asset(dogImages[index], height: 25, width: 25),
                        ),
                      ),
                      8.height,
                      Text(
                        messsgeStatusName[index],
                        style: style2,
                      ),
                    ],
                  );
                }),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(16),
              child: Wrap(
                runSpacing: 16,
                children: List.generate(
                  messageCard.length,
                  (index) => Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              padding: EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white12,
                                image: DecorationImage(image: AssetImage(messageCard[index].imagePath)),
                              ),
                            ),
                            Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: context.cardColor,
                              ),
                              child: Container(
                                margin: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: index == 0 || index == 2 ? Colors.greenAccent.shade400 : primarycolor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        16.width,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                messageCard[index].username,
                                style: boldTextStyle(),
                              ),
                              Text(
                                "User",
                                style: secondaryTextStyle(size: 14),
                              )
                            ],
                          ),
                        ),
                        messageCard[index].unReedMessages != null
                            ? SizedBox(
                                width: 40,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      messageCard[index].lastSeen,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: messageCard[index].unReedMessages != null
                                            ? Colors.greenAccent.shade400
                                            : Colors.grey,
                                      ),
                                    ),
                                    4.height,
                                    Container(
                                      height: 20,
                                      width: 20,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.greenAccent.shade400,
                                      ),
                                      child: Text(
                                        messageCard[index].unReedMessages!,
                                        style: primaryTextStyle(size: 12),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : SizedBox(
                                width: 30,
                                child: Text(
                                  messageCard[index].lastSeen,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: messageCard[index].unReedMessages != null
                                        ? Colors.greenAccent.shade400
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
