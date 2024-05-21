import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/fab_circular_menu.dart';

class ButtonScreen extends StatefulWidget {
  static String tag = '/ButtonScreen';

  @override
  ButtonScreenState createState() => ButtonScreenState();
}

class ButtonScreenState extends State<ButtonScreen> {
  //   The menu can be handled using a key
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  //  maintain the state of the response on loader of button.
  int _state = 0;
  String changeText = 'Login';

  //   List of the Reaction on the click of button
  List<Reaction<int>> reaction = [
    Reaction(
      previewIcon: _buildPreviewIcon('images/Reaction/images/like.gif'),
      icon: _buildIcon(
        'images/Reaction/images/like_fill.png',
        'Like',
        Color(0XFF3b5998),
      ),
      value: 1,
    ),
    Reaction(
      previewIcon: _buildPreviewIcon('images/Reaction/images/love.gif'),
      icon: _buildIcon(
        'images/Reaction/images/love.png',
        'Love',
        Color(0XFFed5168),
      ),
      value: 2,
    ),
    Reaction(
      previewIcon: _buildPreviewIcon('images/Reaction/images/wow.gif'),
      icon: _buildIcon(
        'images/Reaction/images/wow.png',
        'Wow',
        Color(0XFFffda6b),
      ),
      value: 3,
    ),
    Reaction(
      previewIcon: _buildPreviewIcon('images/Reaction/images/haha.gif'),
      icon: _buildIcon(
        'images/Reaction/images/haha.png',
        'Haha',
        Color(0XFFffda6b),
      ),
      value: 4,
    ),
    Reaction(
      previewIcon: _buildPreviewIcon('images/Reaction/images/sad.gif'),
      icon: _buildIcon(
        'images/Reaction/images/sad.png',
        'Sad',
        Color(0XFFffda6b),
      ),
      value: 5,
    ),
    Reaction(
      previewIcon: _buildPreviewIcon('images/Reaction/images/angry.gif'),
      icon: _buildIcon(
        'images/Reaction/images/angry.png',
        'Angry',
        Color(0XFFf05766),
      ),
      value: 6,
    ),
  ];

  //   List of the Reaction on the click of button
  List<Reaction<int>> reaction2 = [
    Reaction(
      previewIcon: _buildPreviewIcon('images/Reaction/images/SocialMedia/whatsapp.png'),
      icon: _buildIcon(
        'images/Reaction/images/SocialMedia/media.png',
        'Contact us',
        Colors.grey[600],
      ),
      value: 1,
    ),
    Reaction(
      previewIcon: _buildPreviewIcon('images/Reaction/images/SocialMedia/fb2.png'),
      icon: _buildIcon(
        'images/Reaction/images/SocialMedia/media.png',
        'Contact us',
        Colors.grey[600],
      ),
      value: 2,
    ),
    Reaction(
      previewIcon: _buildPreviewIcon('images/Reaction/images/SocialMedia/wordpress.png'),
      icon: _buildIcon(
        'images/Reaction/images/SocialMedia/media.png',
        'Contact us',
        Colors.grey[600],
      ),
      value: 3,
    ),
    Reaction(
      previewIcon: _buildPreviewIcon('images/Reaction/images/SocialMedia/map.png'),
      icon: _buildIcon(
        'images/Reaction/images/SocialMedia/media.png',
        'Contact us',
        Colors.grey[600],
      ),
      value: 4,
    ),
    Reaction(
      previewIcon: _buildPreviewIcon('images/Reaction/images/SocialMedia/linkedin.png'),
      icon: _buildIcon(
        'images/Reaction/images/SocialMedia/media.png',
        'Contact us',
        Colors.grey[600],
      ),
      value: 5,
    ),
    Reaction(
      previewIcon: _buildPreviewIcon('images/Reaction/images/SocialMedia/youtube.png'),
      icon: _buildIcon(
        'images/Reaction/images/SocialMedia/media.png',
        'Contact us',
        Colors.grey[600],
      ),
      value: 6,
    ),
  ];

  void animateButton() {
    setState(() {
      _state = 1;
    });
    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        _state = 0;
        changeText = 'Login Successfull';
        Timer(Duration(milliseconds: 3300), () {
          setState(() {
            changeText = 'Login';
          });
        });
      });
    });
  }

  @override
  void initState() {
    changeStatusColor(appStore.scaffoldBackground!);
    super.initState();
  }

  @override
  void dispose() {
    changeStatusColor(appStore.scaffoldBackground!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Button'),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          SizedBox(height: 10),
          Text(
            'Reaction Buttons',
            style: boldTextStyle(),
          ),
          4.height,
          Text(
            'Note : Long press to react',
            style: secondaryTextStyle(color: Colors.red, size: 12),
          ),
          20.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ReactionButton<int>(
                onReactionChanged: (reaction) {
                  print('reaction title: ${reaction?.title}');
                  String message = '';
                  if (reaction?.value == 1) {
                    setState(
                      () {
                        message = "like";
                      },
                    );
                    // ignore: deprecated_member_use
                  } else if (reaction?.value == 2) {
                    setState(
                      () {
                        message = "love";
                      },
                    );
                    // ignore: deprecated_member_use
                  } else if (reaction?.value == 3) {
                    setState(
                      () {
                        message = "wow";
                      },
                    );
                    // ignore: deprecated_member_use
                  } else if (reaction?.value == 4) {
                    setState(
                      () {
                        message = "haha";
                      },
                    );
                    // ignore: deprecated_member_use
                  } else if (reaction?.value == 5) {
                    setState(
                      () {
                        message = "sad";
                      },
                    );
                    // ignore: deprecated_member_use
                  } else if (reaction?.value == 6) {
                    setState(
                      () {
                        message = "angry";
                      },
                    );
                  }
                  toasty(context, 'You clicked $message share');
                },
                reactions: reaction,
                boxRadius: 10,
                itemSize: Size(40, 40),
              ),
              ReactionButton<int>(
                onReactionChanged: (reaction) {
                  String message = '';
                  print('reaction title: ${reaction?.title}');

                  if (reaction?.value == 1) {
                    setState(
                      () {
                        message = "Whatsapp";
                      },
                    );
                    // ignore: deprecated_member_use
                  } else if (reaction?.value == 2) {
                    setState(
                      () {
                        message = "Facebook";
                      },
                    );
                    // ignore: deprecated_member_use
                  } else if (reaction?.value == 3) {
                    setState(
                      () {
                        message = "Wordpress";
                      },
                    );
                    // ignore: deprecated_member_use
                  } else if (reaction?.value == 4) {
                    setState(
                      () {
                        message = "Map";
                      },
                    );
                    // ignore: deprecated_member_use
                  } else if (reaction?.value == 5) {
                    setState(
                      () {
                        message = "Linkedin";
                      },
                    );
                    // ignore: deprecated_member_use
                  } else if (reaction?.value == 6) {
                    setState(
                      () {
                        message = "Youtube";
                      },
                    );
                  }
                  toasty(context, 'You clicked $message share');
                },
                reactions: reaction2,
                boxRadius: 10,
                itemSize: Size(40, 40),
              ),
            ],
          ),
          10.height,
          Divider(),
          10.height,
          Text(
            'Button with Progress Bar',
            style: boldTextStyle(),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(10),
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                backgroundColor: Color(0xFF8998FF),
                padding: EdgeInsets.all(0.0),
              ),
              child: _state != 1
                  ? Text(
                      changeText,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    )
                  : SizedBox(
                      height: 36.0,
                      width: 36.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
              onPressed: () {},
              /* onHighlightChanged: (isPressed) {
                setState(() {
                  if (_state == 0) {
                    animateButton();
                  }
                });
              },*/
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildPreviewIcon(String path) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 5),
      child: Image.asset(path, height: 40),
    );

Widget _buildIcon([String? path, String? text, Color? textColor]) => Container(
      color: Colors.transparent,
      child: Row(
        children: <Widget>[
          Image.asset(
            path!,
            height: 24,
          ),
          10.width,
          Text(
            text!,
            style: boldTextStyle(
              size: 16,
            ),
          ),
        ],
      ),
    );
