import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/View/utilities/ui_colour.dart';
import 'package:flutter_movie_ticketing_app/View/widgets/cinema_chairs_widget.dart';
import 'package:flutter_movie_ticketing_app/View/widgets/cinema_screen.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/date_selection_animation.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/start_button.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/time_selection_animation.dart';

class BookingScreen extends StatefulWidget {
  static const String name = '/bookingScreen';
  const BookingScreen({
    super.key,
  });

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: UiColour().bookingbg,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.01),
        title: const Text(
          'Booking Screen',
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
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
                colors: [UiColour().bookingbg, UiColour().bookingbgSecond])),
        child: ListView(
          dragStartBehavior: DragStartBehavior.down,
          children: <Widget>[
            SizedBox(height: height * 0.13, child: DateSelectionAnimation()),
            SizedBox(
              height: height * 0.13,
              child: const TimeSelectionAnimation(),
            ),
            SizedBox(
              height: height * 0.02,
              width: width * 0.8,
              child: CinemaScreenWidget(),
            ),
            SizedBox(
              height: height * 0.07,
            ),
            SizedBox(height: height * 0.45, child: const CinemaChairsWidget()),
            SizedBox(
              height: height * 0.01,
            ),
            StartButton(
              backgroundColour: UiColour().onboardColourSecond,
              fontColour: Colors.white,
              titleText: 'Start',
              onPressed: () {
                // Navigator.pushNamed(context, LandingScreen.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
