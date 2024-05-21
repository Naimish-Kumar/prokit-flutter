import 'dart:core';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../components/home_screen_component/trending_movies_component.dart';
import '../../components/home_screen_component/movies_banner_component.dart';
import '../../components/home_screen_component/popular_actors_component.dart';
import '../../components/home_screen_component/latest_movies_component.dart';
import '../../components/home_screen_component/movie_banner_component.dart';
import '../../model/image_data_model.dart';

class HomeScreen extends StatefulWidget {
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  late PageController pageController;
  List<String> titleList = [];
  List<Widget> homeScreenComponent = [];
  List<ImageDataModel> latestmoviesList = getlatestMovies();

  void initState() {
    super.initState();
    setStatusBarColor(Colors.transparent);
    pageController = PageController();
    titleList = ['Latest', 'Popular Actors', '', 'Trends'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: ScrollController(),
          padding: EdgeInsets.only(bottom: 26),
          child: Wrap(
            runSpacing: 32,
            children: [
              MoviesBannerComponent(),
              LatestMoviesComponent(),
              MovieBannerComponent(),
              PopularActorsComponent(),
              TrendingMoviesComponent(),
            ],
          )),
    );
  }
}
