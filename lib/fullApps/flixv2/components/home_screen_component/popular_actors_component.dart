import 'package:flutter/material.dart';

import 'package:prokit_flutter/fullApps/flixv2/model/actor_data_model.dart';
import 'package:prokit_flutter/fullApps/flixv2/screen/actor_screens/actor_detail_screen.dart';
import 'package:prokit_flutter/fullApps/flixv2/utils/common_widgets.dart';

class PopularActorsComponent extends StatefulWidget {
  State<PopularActorsComponent> createState() => PopularActorsComponentState();
}

class PopularActorsComponentState extends State<PopularActorsComponent> {
  List<ActorDataModel> actorsImages = getActorsDetail();

  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        titleRowItem(title: 'Popular Actors', isSeeAll: false),
        SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Wrap(
            spacing: 16,
            children: List.generate(actorsImages.length, (index) {
              ActorDataModel actorImage = actorsImages[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ActorDetailScreen(
                        actorData: actorsImages[index],
                      ),
                    ),
                  );
                },
                child: actorImageItem(imageName: actorImage.imageName!, name: actorImage.title!),
              );
            }),
          ),
        )
      ],
    );
  }
}
