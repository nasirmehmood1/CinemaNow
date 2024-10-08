import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/Model/image_poster_model.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/fade_animation.dart';

class UpcomingMoviesList extends StatelessWidget {
  const UpcomingMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: listOfPosterImages.length,
        itemBuilder: (BuildContext context, int index) {
          return FadeAnimation(
            delay: 1.0 + index,
            fadeInDirection: FadeInDirection.ltr,
            fadeOffset: 40,
            child: Card(
              borderOnForeground: true,
              elevation: 20,
              shape: const CircleBorder(),
              child: Image.asset(
                listOfPosterImages[index],
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }
}
