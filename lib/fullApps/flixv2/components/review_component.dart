import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/flixv2/screen/user_profile_screen.dart';

import '../model/movie_reviews_model.dart';

class ReviewComponent extends StatefulWidget {
  final MovieDataModel movieReview;
  final int reviewsOfIndex;
  final int reviewIndex;

  ReviewComponent({required this.movieReview, required this.reviewIndex, required this.reviewsOfIndex});

  State<ReviewComponent> createState() => ReviewComponentState();
}

class ReviewComponentState extends State<ReviewComponent> {
  bool readMore = false;
  late String firstpart;
  late String nextpart;

  void initState() {
    super.initState();

    String review = widget.movieReview.reviews![widget.reviewIndex];
    if (review.length > 150) {
      firstpart = review.substring(0, 150);
      nextpart = review.substring(150, review.length);
    } else {
      firstpart = review.substring(0, review.length);
      nextpart = '';
    }
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      runSpacing: 8,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(widget.movieReview.userImageNames![widget.reviewIndex]),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UserProfileScreen(
                        userDetailOfIndex: widget.reviewsOfIndex,
                        index: widget.reviewIndex,
                      ),
                    ),
                  );
                },
                child: Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      widget.movieReview.names![widget.reviewIndex],
                      textAlign: TextAlign.left,
                      style: primaryTextStyle(size: 14),
                    ),
                    Text(
                      '@${widget.movieReview.usernames![widget.reviewIndex]}',
                      style: secondaryTextStyle(size: 12),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Wrap(
          alignment: WrapAlignment.end,
          children: [
            nextpart.isNotEmpty
                ? Text(
                    readMore ? (firstpart + nextpart) : (firstpart + " ..."),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    maxLines: readMore ? 10 : 4,
                    style: secondaryTextStyle(
                      size: 14,
                    ),
                  )
                : Text(
                    firstpart,
                    textAlign: TextAlign.justify,
                    style: secondaryTextStyle(size: 14),
                  ),
            GestureDetector(
              onTap: () {
                readMore = !readMore;
                setState(() {});
              },
              child: Text(
                readMore ? 'Less' : 'More',
                textAlign: TextAlign.start,
                style: boldTextStyle(color: Colors.red, size: 12),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
                alignment: WrapAlignment.center,
                spacing: 2,
                children: List.generate(5, (index) {
                  return Icon(
                    index <= widget.movieReview.starRates! ? Icons.star_rate_rounded : Icons.star_border_rounded,
                    color: Colors.amber.shade700,
                    size: 18,
                  );
                })),
            Text(
              '${widget.reviewIndex * 5 + 4} min ago',
              style: secondaryTextStyle(size: 12, color: Colors.white60),
            ),
          ],
        ),
      ],
    );
  }
}
