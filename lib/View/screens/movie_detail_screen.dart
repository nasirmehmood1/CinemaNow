import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/Model/movie_lcard_model.dart';
import 'package:flutter_movie_ticketing_app/View/screens/booking_screen.dart';
import 'package:flutter_movie_ticketing_app/View/widgets/highlight_container.dart';
import 'package:flutter_movie_ticketing_app/View/widgets/highlighted_text.dart';
import 'dart:developer' as developer;
import 'package:flutter_movie_ticketing_app/View_Model/utilities/ui_colour.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/fade_animation.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/start_button.dart';
import 'package:intl/intl.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});
  static const String name = '/details';

  @override
  Widget build(BuildContext context) {
    // Fetch the arguments and provide a fallback if they are null
    final args = ModalRoute.of(context)?.settings.arguments;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM').format(now);
    dynamic currentTime = DateFormat.jm().format(DateTime.now());

    if (args == null || args is! MoviecardModel) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('No movie details found.'),
        ),
      );
    }

    // Safely cast the arguments to MoviecardModel
    final MoviecardModel listOfMovieDetails = args as MoviecardModel;
    // developer.log('data given $listOfMovieDetails');

    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: UiColour().movieScreenColourUpper,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.01),
        title: const Text(
          'Movies Detail',
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.black26,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                transform: const GradientRotation(2),
                colors: [
              UiColour().movieScreenColourUpper,
              UiColour().onboardColourSecond
            ])),
        child: ListView(
          dragStartBehavior: DragStartBehavior.down,
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            FadeAnimation(
              delay: 4,
              fadeInDirection: FadeInDirection.ltr,
              fadeOffset: 40,
              child: Row(
                children: [
                  SizedBox(
                    width: width * 0.2,
                  ),
                  Container(
                    height: height * 0.45,
                    width: width * 0.6,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            listOfMovieDetails.backGroundImage,
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(width * 0.1)),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: height * 0.03,
                          left: width * 0.12,
                          child: Text(
                            listOfMovieDetails.movieTitile,
                            style: TextStyle(
                              color: UiColour().fontColour,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            FadeAnimation(
              delay: 5,
              fadeInDirection: FadeInDirection.ttb,
              fadeOffset: 40,
              child: Row(
                children: [
                  SizedBox(
                    width: width * 0.06,
                  ),
                  HighlightContainer(
                      primaryText: 'IMBD : ',
                      secondaryText: listOfMovieDetails.movieImbdRating,
                      backgroundColour: Colors.orange,
                      fontColour: Colors.black87),
                  SizedBox(
                    width: width * 0.07,
                  ),
                  HighlightContainer(
                    primaryText: 'Time:',
                    secondaryText: '1:30',
                    backgroundColour: Colors.black.withOpacity(0.03),
                    fontColour: Colors.white,
                  ),
                  SizedBox(
                    width: width * 0.1,
                  ),
                  HighlightContainer(
                      primaryText: '',
                      secondaryText: formattedDate,
                      backgroundColour: Colors.black.withOpacity(0.03),
                      fontColour: Colors.white)
                ],
              ),
            ),
            SizedBox(
              height: height * 0.015,
            ),
            FadeAnimation(
              delay: 5,
              fadeInDirection: FadeInDirection.ttb,
              fadeOffset: 40,
              child: Row(
                children: [
                  SizedBox(
                    width: width * 0.06,
                  ),
                  const HighlightedText(
                      titleText: 'About',
                      backgroundColour: Colors.black12,
                      textColour: Colors.black),
                  SizedBox(
                    width: width * 0.06,
                  ),
                  HighlightedText(
                      titleText: 'Top Cast',
                      backgroundColour: Colors.black.withOpacity(0.03),
                      textColour: Colors.white),
                  SizedBox(
                    width: width * 0.06,
                  ),
                  HighlightedText(
                      titleText: listOfMovieDetails.movieType,
                      backgroundColour: UiColour().glassNeumarphic,
                      textColour: Colors.white),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            FadeAnimation(
              delay: 5,
              fadeInDirection: FadeInDirection.btt,
              fadeOffset: 40,
              child: Row(
                children: [
                  SizedBox(
                    width: width * 0.1,
                  ),
                  SizedBox(
                      height: height * 0.1,
                      width: width * 0.8,
                      child: Center(
                        child: Text(
                          listOfMovieDetails.movieDescription,
                          maxLines: 6,
                          overflow: TextOverflow.visible,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.06,
            ),
            StartButton(
              backgroundColour: UiColour().buttonColour,
              fontColour: Colors.white,
              titleText: 'Get Reservation',
              onPressed: () {
                Navigator.pushNamed(context, BookingScreen.name,
                    arguments: listOfMovieDetails);
              },
            ),
          ],
        ),
      ),
    );
  }
}
