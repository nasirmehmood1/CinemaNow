import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/Model/movie_lcard_model.dart';
import 'package:flutter_movie_ticketing_app/View/widgets/movie_card.dart';
import 'package:flutter_movie_ticketing_app/View/screens/movies_screens/movie_detail_screen.dart';
import 'package:flutter_movie_ticketing_app/View/utilities/ui_colour.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/brillent_animation.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/fade_animation.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});
  static const String name = '/screenMi';
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          transform: const GradientRotation(2),
          colors: [UiColour().homeColourOne, UiColour().homeColourSecond],
        ),
      ),
      child: ListView(
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.06,
              ),
              const FadeAnimation(
                delay: 4,
                fadeInDirection: FadeInDirection.ttb,
                fadeOffset: 40,
                child: Row(
                  children: [
                    Text(
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
              ),
            ],
          ),
          SizedBox(
            height: height * 0.03,
          ),
          SizedBox(
              height:
                  height * 0.95, // Specify the desired height for the ListView
              child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 10,
                  itemCount: listOfMovieCards.length,
                  itemBuilder: (context, index) {
                    return BrilliantGridAnimation(
                      delay: index * 0.4,
                      fadeOffset: 40,
                      scaleFactor: 1.2,
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
        ],
      ),
    );
  }
}
