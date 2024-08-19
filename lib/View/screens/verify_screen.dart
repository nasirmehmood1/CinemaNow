import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/athentication_animation.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/face_scan_animation.dart';
import 'package:flutter_movie_ticketing_app/View_Model/utilities/ui_colour.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});
  static const String name = '/verfiy ';

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        body: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    transform: const GradientRotation(2),
                    colors: [
                  UiColour().bgOne,
                  UiColour().paymentScreenBgSecond
                ])),
            child: Center(
                child: Column(
              children: [
                SizedBox(
                  height: height * 0.7,
                ),
                FingerprintIcon(),
              ],
            ))));
  }
}
