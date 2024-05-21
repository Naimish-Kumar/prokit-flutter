import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/flixv2/model/image_data_model.dart';
import 'package:prokit_flutter/fullApps/flixv2/screen/movies_screen/movie_detail_screen.dart';
import 'package:prokit_flutter/fullApps/flixv2/screen/movies_screen/movie_screen.dart';
import 'package:prokit_flutter/fullApps/flixv2/utils/common_widgets.dart';

class TrendingMoviesComponent extends StatefulWidget {
  State<TrendingMoviesComponent> createState() => TrendingMoviesComponentState();
}

class TrendingMoviesComponentState extends State<TrendingMoviesComponent> {
  List<ImageDataModel> latestmoviesList = getlatestMovies();

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
        titleRowItem(
          title: 'Trends',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MovieScreen(
                  title: 'Trends',
                ),
              ),
            );
          },
          isSeeAll: true,
        ),
        SizedBox(height: 4),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Wrap(
            spacing: 16,
            children: List.generate(latestmoviesList.length, (index) {
              ImageDataModel movieImage = latestmoviesList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MovieDetailScreen(
                        index: index,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 129,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          movieImage.imageName!,
                          height: 200,
                          width: 129,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      SizedBox(height: 8),
                      Text(
                        movieImage.title!,
                        textAlign: TextAlign.left,
                        style: boldTextStyle(size: 14),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            movieImage.duration!,
                            style: secondaryTextStyle(size: 12),
                          ),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 2,
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: Colors.yellow.shade700,
                                size: 14,
                              ),
                              Text(
                                movieImage.ratings!,
                                style: secondaryTextStyle(size: 12),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
