import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/flixv2/components/video_component.dart';
import 'package:prokit_flutter/fullApps/flixv2/utils/common_widgets.dart';

import '../utils/videosdata.dart';

class HistoryScreen extends StatefulWidget {
  State<HistoryScreen> createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  var watching = true;
  List<VideoDataModel> videosList = getMovieClips();

  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          isLeading: true,
          title: 'History',
          onTap: () {
            Navigator.of(context).pop();
          }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    watching = !watching;
                    setState(() {});
                  },
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 2 - 16,
                    decoration: BoxDecoration(
                      color: watching ? Colors.red : Colors.red.shade100,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        bottomLeft: Radius.circular(4),
                      ),
                    ),
                    child: Text(
                      'Watching',
                      textAlign: TextAlign.center,
                      style: primaryTextStyle(color: watching ? Colors.white : Colors.red),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    watching = !watching;
                    setState(() {});
                  },
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 2 - 16,
                    decoration: BoxDecoration(
                      color: watching ? Colors.red.shade100 : Colors.red,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                    ),
                    child: Text(
                      'Downloaded',
                      textAlign: TextAlign.center,
                      style: primaryTextStyle(
                        color: watching ? Colors.red : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Wrap(
                runSpacing: 16,
                children: List.generate(videosList.length, (index) {
                  VideoDataModel videoDetail = videosList[index];
                  return Row(
                    children: [
                      watchingComponent(index),
                      SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2 - 32,
                          child: Wrap(
                            runSpacing: 24,
                            children: [
                              Text(
                                videoDetail.movieName!,
                                style: boldTextStyle(),
                              ),
                              Wrap(
                                direction: Axis.vertical,
                                children: [
                                  Text(
                                    '00:34:29 : 01:02:02',
                                    style: TextStyle(color: Colors.white60, fontSize: 12),
                                  ),
                                  Text(
                                    'Last watched 12h ago',
                                    style: TextStyle(color: Colors.white60, fontSize: 12),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      GestureDetector(
                        onTap: () {
                          watching
                              ? showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      padding: EdgeInsets.all(16),
                                      child: Column(
                                        children: [
                                          Text(
                                            videoDetail.movieName!,
                                            style: boldTextStyle(size: 22),
                                          ),
                                          SizedBox(height: 16),
                                          ...List.generate(
                                            3,
                                            (index) => Container(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Season ${index + 1}',
                                                    style: primaryTextStyle(size: 18),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: Icon(
                                                      Icons.expand_more_rounded,
                                                      size: 28,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.only(top: 16, bottom: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(14),
                                      topLeft: Radius.circular(14),
                                    ),
                                  ),
                                )
                              : showDialog(
                                  context: context,
                                  builder: (context) {
                                    return alertContainer(index, videoDetail.movieName!);
                                  });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            watching ? Icons.arrow_forward_ios_rounded : Icons.delete,
                            color: watching ? Colors.white60 : Colors.red,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget watchingComponent(int index) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width / 2 - 24,
      child: VideoComponent(videoTitle: videosList[index].videoTitle),
    );
  }

  Widget alertContainer(int index, String movieName) {
    return AlertDialog(
      alignment: Alignment.center,
      title: Text(
        'Delete $movieName',
        textAlign: TextAlign.center,
        style: boldTextStyle(size: 20),
      ),
      content: Text(
        "Are sure you want to delete ' $movieName ' from storage? ",
        textAlign: TextAlign.center,
        style: secondaryTextStyle(),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: secondaryTextStyle(size: 14),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: context.cardColor,
                duration: Duration(milliseconds: 800),
                content: Text(
                  'Deleted $movieName!',
                  style: secondaryTextStyle(),
                ),
              ),
            );
          },
          child: Text(
            'Delete Now',
            style: primaryTextStyle(color: Colors.red, size: 14),
          ),
        )
      ],
    );
  }
}
