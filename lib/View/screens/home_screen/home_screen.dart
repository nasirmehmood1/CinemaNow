import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/Model/image_poster_model.dart';
import 'package:flutter_movie_ticketing_app/Model/movie_lcard_model.dart';
import 'package:flutter_movie_ticketing_app/View/widgets/movie_card.dart';
import 'package:flutter_movie_ticketing_app/View/screens/movies_screens/movie_detail_screen.dart';
import 'package:flutter_movie_ticketing_app/View/screens/movies_screens/movies_screen.dart';
import 'package:flutter_movie_ticketing_app/View/utilities/ui_colour.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/brillent_animation.dart';
import 'package:flutter_movie_ticketing_app/View_Model/custom_slider/slide_animation.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/fade_animation.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class MyHomePage extends StatefulWidget {
  static const String name = '/home';

  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            transform: const GradientRotation(2),
            colors: [UiColour().homeColourOne, UiColour().homeColourSecond],
          ),
        ),
        child: ListView(dragStartBehavior: DragStartBehavior.down, children: [
          SizedBox(
            height: height * 0.01,
          ),
          FadeAnimation(
            delay: 6,
            fadeInDirection: FadeInDirection.ttb,
            fadeOffset: 40,
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.03,
                ),
                CircleAvatar(
                  maxRadius: 25,
                  backgroundColor: Colors.deepPurple.shade100,
                  backgroundImage: const AssetImage(
                    'assets/images/nasir.jpeg',
                  ),
                ),
                SizedBox(
                  width: width * 0.04,
                ),
                const Text(
                  'Welcome Nasir',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.search,
                  color: Colors.deepOrange,
                  size: 50,
                ),
              ],
            ),
          ),
          // Personalized greeting with fade animation.
          FadeAnimation(
            delay: 6,
            fadeInDirection: FadeInDirection.rtl,
            fadeOffset: 60,
            child: SizedBox(
              height: height * 0.4,
              width: width,
              child: SliderAnimation(list: listOfMovieCards),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.03,
              ),
              const Row(
                children: [
                  const Text(
                    'Popular ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    'Movies',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: width * 0.35,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MoviesScreen.name);
                },
                child: const Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),

          SizedBox(
              height:
                  height * 0.45, // Specify the desired height for the ListView
              child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 10,
                  itemCount: listOfMovieCards.length,
                  itemBuilder: (context, index) {
                    return BrilliantGridAnimation(
                      delay: index * 0.5,
                      fadeOffset: 40,
                      scaleFactor: 1.4,
                      child: Stack(
                        fit: StackFit.passthrough,

                        /// <-- expand to the size of the parent constraint
                        children: [
                          ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(35)),
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.amberAccent, width: 2)),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, MovieDetailScreen.name,
                                          arguments: listOfMovieCards[index]);
                                    },
                                    child: MovieCard(
                                        title:
                                            listOfMovieCards[index].movieTitile,
                                        image: listOfMovieCards[index]
                                            .backGroundImage,
                                        movieType:
                                            listOfMovieCards[index].movieType,
                                        movieRating: listOfMovieCards[index]
                                            .movieImbdRating),
                                  )))
                        ],
                      ),
                    );
                  },
                  staggeredTileBuilder: (index) {
                    return StaggeredTile.count(1, index.isEven ? 1 : 2);
                  })),
        ]));
  }
}
