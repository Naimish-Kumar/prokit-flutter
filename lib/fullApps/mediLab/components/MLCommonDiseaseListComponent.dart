import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLDiseaseData.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLDiseaseSymptomsScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';

class MLCommonDiseaseListComponent extends StatefulWidget {
  static String tag = '/MLCommonDiseaseListComponent';

  @override
  MLCommonDiseaseListComponentState createState() => MLCommonDiseaseListComponentState();
}

class MLCommonDiseaseListComponentState extends State<MLCommonDiseaseListComponent> {
  List<MLDiseaseData> data = mlDiseaseDataList();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      children: data.map((data) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: boxDecorationWithRoundedCorners(
            borderRadius: radius(12),
            border: Border.all(color: mlColorLightGrey),
            backgroundColor: context.cardColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonCachedNetworkImage(data.image.validate(), fit: BoxFit.cover, height: 100, width: context.width()).cornerRadiusWithClipRRect(12.0),
              8.height,
              Text(data.title.validate(), style: boldTextStyle()),
              4.height,
              Text(data.subtitle.validate(), style: secondaryTextStyle(size: 16)),
            ],
          ),
        ).onTap(
          () {
            MLDieaseseSymptomsScreen().launch(context);
          },
        );
      }).toList(),
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
    );
  }
}
