import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../components/cached_image_widget.dart';
import '../../../utils/images.dart';

class SliderLocationComponent extends StatefulWidget {
  @override
  _SliderLocationComponentState createState() => _SliderLocationComponentState();
}

class _SliderLocationComponentState extends State<SliderLocationComponent> {
  PageController sliderPageController = PageController(initialPage: 0);

  List<String> sliderImgList = [img_slider, img_slider, img_slider];

  @override
  void initState() {
    super.initState();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
    sliderPageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: context.width(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          PageView(
            controller: sliderPageController,
            children: List.generate(
              sliderImgList.length,
              (index) {
                return CachedImageWidget(
                  url: sliderImgList[index],
                  height: 250,
                  width: 200,
                  fit: BoxFit.fill,
                ).cornerRadiusWithClipRRect(18).paddingAll(16);
              },
            ),
          ),
          if (sliderImgList.length.validate() > 1)
            Positioned(
              bottom: -10,
              left: 0,
              right: 0,
              child: DotIndicator(
                pageController: sliderPageController,
                pages: sliderImgList,
                indicatorColor: white,
                unselectedIndicatorColor: white,
                currentBoxShape: BoxShape.rectangle,
                boxShape: BoxShape.rectangle,
                borderRadius: radius(2),
                currentBorderRadius: radius(3),
                currentDotSize: 18,
                currentDotWidth: 6,
                dotSize: 6,
              ),
            ),
        ],
      ),
    );
  }
}
