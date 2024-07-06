import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/View/utilities/ui_colour.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String image;
  final String movieType;
  final String movieRating;

  const MovieCard(
      {super.key,
      required this.title,
      required this.image,
      required this.movieType,
      required this.movieRating});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      elevation: 5,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              image,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            top: height * 0.02,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.yellow[700],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'IMDb $movieRating',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.03,
            left: width * 0.03,
            child: Text(
              title,
              style: TextStyle(
                color: UiColour().fontColour,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.01,
            left: width * 0.03,
            child: Text(
              movieType,
              style: TextStyle(
                  color: UiColour().homeColourOne,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
