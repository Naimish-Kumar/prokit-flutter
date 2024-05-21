import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/flixv2/utils/common_widgets.dart';
import 'package:prokit_flutter/main.dart';

import '../components/review_component.dart';
import '../model/movie_reviews_model.dart';

class ReviewScreen extends StatefulWidget {
  final MovieDataModel movieReview;
  final int index;

  ReviewScreen({required this.index, required this.movieReview});

  State<ReviewScreen> createState() => ReviewScreenState();
}

class ReviewScreenState extends State<ReviewScreen> {
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: backButton(),
        ),
        title: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: '${widget.movieReview.title}/',
              style: boldTextStyle(size: 22, color: appStore.isDarkModeOn ? Colors.white60 : Colors.grey.shade400),
            ),
            TextSpan(text: 'Reviews', style: boldTextStyle(size: 22))
          ]),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              children: [],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Top Reviews',
              textAlign: TextAlign.center,
              style: boldTextStyle(size: 20),
            ),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width - 32,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.circular(defaultRadius)),
              child: ReviewComponent(
                movieReview: widget.movieReview,
                reviewIndex: 0,
                reviewsOfIndex: widget.index,
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Wrap(
              spacing: 16,
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  'Other Reviews',
                  textAlign: TextAlign.center,
                  style: boldTextStyle(size: 20),
                ),
                Wrap(
                  direction: Axis.vertical,
                  spacing: 16,
                  children: List.generate(widget.movieReview.reviews!.length - 1, (index) {
                    return Container(
                      width: MediaQuery.of(context).size.width - 32,
                      padding: EdgeInsets.all(16),
                      decoration:
                          BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.circular(defaultRadius)),
                      child: ReviewComponent(
                        reviewIndex: index + 1,
                        reviewsOfIndex: widget.index,
                        movieReview: widget.movieReview,
                      ),
                    );
                  }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
