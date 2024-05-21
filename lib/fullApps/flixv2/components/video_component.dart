import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:video_player/video_player.dart';

class VideoComponent extends StatefulWidget {
  String? videoTitle;

  VideoComponent({this.videoTitle});

  State<VideoComponent> createState() => VideoComponentState();
}

class VideoComponentState extends State<VideoComponent> {
  ValueNotifier<VideoPlayerValue?> currentPosition = ValueNotifier(null);
  VideoPlayerController? videoPlayerController;
  late Future<void> futureController;

  startVideo() {
    videoPlayerController = VideoPlayerController.network(widget.videoTitle!);
    futureController = videoPlayerController!.initialize();
  }

  @override
  void initState() {
    startVideo();
    videoPlayerController!.addListener(
      () {
        if (videoPlayerController!.value.isInitialized) {
          currentPosition.value = videoPlayerController!.value;
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureController,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Transform.scale(scale: 0.3, child: CircularProgressIndicator());
        else if (snapshot.connectionState == ConnectionState.done) {
          return GestureDetector(
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: VideoPlayer(
                    videoPlayerController!,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: IconButton(
                    icon: Icon(videoPlayerController!.value.isPlaying
                        ? Icons.pause_circle_filled_outlined
                        : Icons.play_arrow_rounded),
                    onPressed: () {
                      setState(() {
                        if (videoPlayerController!.value.isPlaying) {
                          videoPlayerController!.pause();
                        } else {
                          videoPlayerController!.play();
                        }
                      });
                    },
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 16,
                  child: Container(
                    height: 4,
                    width: MediaQuery.of(context).size.width - 64,
                    decoration: BoxDecoration(
                      color: context.cardColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return Text(
            'Loading...',
            style: boldTextStyle(
              size: 16,
            ),
          );
        }
      },
    );
  }
} /**/
