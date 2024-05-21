import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/flixv2/components/review_component.dart';
import 'package:prokit_flutter/fullApps/flixv2/utils/common_widgets.dart';
import 'package:prokit_flutter/fullApps/flixv2/model/movie_reviews_model.dart';

import '../../screen/review_screen.dart';

class MoviesReviewComponent extends StatefulWidget {
  final MovieDataModel movieReview;
  final int reviewsOfIndex;
  MoviesReviewComponent({required this.movieReview, required this.reviewsOfIndex});

  State<MoviesReviewComponent> createState() => MoviesReviewComponentState();
}

class MoviesReviewComponentState extends State<MoviesReviewComponent> {
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 16,
      children: [
        titleRowItem(isSeeAll: false, title: 'Reviews'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Wrap(
            spacing: 16,
            children: List.generate(widget.movieReview.reviews!.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReviewScreen(
                        index: widget.reviewsOfIndex,
                        movieReview: widget.movieReview,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 380,
                  padding: EdgeInsets.all(16),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(defaultRadius), color: context.cardColor),
                  child: ReviewComponent(
                    reviewIndex: index,
                    reviewsOfIndex: widget.reviewsOfIndex,
                    movieReview: widget.movieReview,
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
