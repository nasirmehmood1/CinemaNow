import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/View/screens/Landing_screen/landing_screen.dart';
import 'package:flutter_movie_ticketing_app/View/utilities/ui_colour.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/animated_cards.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/fade_animation.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/start_button.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});
  static const String name = '/';

  static const movieAppDescription =
      '"A convenient app for browsing, booking, and managing movie tickets seamlessly."';
  @override
  State<OnBoardingPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardingPage> {
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
              colors: [
            UiColour().onboardColourOne,
            UiColour().onboardColourSecond
          ])),
      child: Column(
        children: [
          const AnimatedRotatedCards(),
          SizedBox(
            height: height * 0.05,
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.05,
              ),
              const Expanded(
                child: FadeAnimation(
                    delay: 7,
                    fadeOffset: 40,
                    fadeInDirection: FadeInDirection.ltr,
                    child: Text(
                      'A convenient app for browsing, booking, and managing movie tickets seamlessly.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.none),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.07,
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.05,
              ),
              FadeAnimation(
                  delay: 7,
                  fadeOffset: 40,
                  fadeInDirection: FadeInDirection.ltr,
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * 0.18,
                      ),
                      const Text(
                        'Cinema',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none),
                      ),
                      const Text(
                        'Seat',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none),
                      ),
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: height * 0.05,
          ),
          StartButton(
            backgroundColour: Colors.pink.shade200,
            fontColour: Colors.white,
            titleText: 'Start',
            onPressed: () {
              Navigator.pushNamed(context, LandingScreen.name);
            },
          ),
        ],
      ),
    );
  }
}
