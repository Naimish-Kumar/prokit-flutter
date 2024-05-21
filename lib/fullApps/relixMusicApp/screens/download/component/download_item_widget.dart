import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../components/cached_image_widget.dart';
import '../../../components/gradient_icon_widget.dart';
import '../../../components/icon_background_widget.dart';
import '../../../utils/constant.dart';
import '../../../utils/images.dart';
import '../model/download_list_model.dart';

class DownloadItemWidget extends StatefulWidget {
  final DownloadSongListModel? modObj;
  final bool isPodcastDetail;

  DownloadItemWidget({this.modObj, this.isPodcastDetail = false});

  @override
  _DownloadItemWidgetState createState() => _DownloadItemWidgetState();
}

class _DownloadItemWidgetState extends State<DownloadItemWidget> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              children: [
                CachedImageWidget(
                  url: widget.modObj!.image.validate(),
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ).cornerRadiusWithClipRRect(12),
              ],
            ),
            16.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextIcon(
                  text: widget.modObj!.day != null ? '${widget.modObj!.day.validate()} | ${widget.modObj!.time.validate()}' : widget.modObj!.time.validate(),
                  textStyle: secondaryTextStyle(),
                  expandedText: true,
                  edgeInsets: EdgeInsets.zero,
                  spacing: 0,
                  suffix: Icon(Icons.more_vert, color: whiteColor).onTap(() {
                    //
                  }, borderRadius: radius(DEFAULT_RADIUS)),
                ),
                4.height,
                Text(widget.modObj!.message.validate(), style: boldTextStyle(color: whiteColor), maxLines: 2, overflow: TextOverflow.ellipsis).paddingRight(16),
                8.height,
                RichTextWidget(
                  list: [
                    TextSpan(text: widget.modObj!.itemName.validate(), style: secondaryTextStyle()),
                    if (widget.modObj!.itemName.validate().isNotEmpty) TextSpan(text: ' | ', style: secondaryTextStyle()),
                    TextSpan(text: widget.modObj!.itemType.validate(), style: secondaryTextStyle()),
                  ],
                ),
              ],
            ).expand(),
          ],
        ),
        8.height,
        if (widget.modObj!.podcastTime != null) Text(widget.modObj!.podcastTime.validate(), style: secondaryTextStyle()),
        if (widget.modObj!.podcastTime != null) 6.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    widget.modObj!.isLike = !widget.modObj!.isLike.validate();
                    setState(() {});
                  },
                  splashColor: Colors.transparent,
                  child: widget.modObj!.isLike.validate() ? GradientIconWidget(icon: Icons.favorite) : Icon(Icons.favorite, size: 24, color: Colors.grey),
                ),
                16.width,
                InkWell(
                  onTap: () {
                    //
                  },
                  borderRadius: radius(defaultInkWellRadius),
                  child: IconBackgroundWidget(
                    icon: widget.isPodcastDetail ? ic_add : ic_check,
                    color: widget.isPodcastDetail ? Colors.white : Colors.green,
                    boxHeight: 20,
                    boxWidth: 20,
                    padding: 6,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                //
              },
              borderRadius: radius(defaultInkWellRadius),
              child: Icon(Icons.play_arrow, size: 28, color: whiteColor),
            ),
          ],
        ),
      ],
    );
  }
}
