import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/Model/booking_model.dart';
import 'package:flutter_movie_ticketing_app/View/screens/payment_screen.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/fade_animation.dart';
import 'package:flutter_movie_ticketing_app/View_Model/utilities/ui_colour.dart';
import 'package:flutter_movie_ticketing_app/View/widgets/list_image_posters.dart';
import 'package:flutter_movie_ticketing_app/View/widgets/location_widget.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/animated_card_swiper.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/start_button.dart';
import 'dart:developer' as developer;
import 'package:intl/intl.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});
  static const String name = '/ticket';

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late BookingModel details;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null || args is! BookingModel) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('No movie details found.'),
        ),
      );
    }
    details = args;

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM').format(now);
    dynamic currentTime = DateFormat.jm().format(DateTime.now());

    List<String> chairsList = _getSelectedChairsLocations();
    int chairListLength = chairsList.length;
    developer.log('chair length: $chairListLength');

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: UiColour().onboardColourSecond,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.01),
        title: const Text(
          'Ticket Screen',
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
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                transform: const GradientRotation(2),
                colors: [
              UiColour().onboardColourSecond,
              UiColour().onboardColourOne
            ])),
        child: ValueListenableBuilder(
          valueListenable: details.bookedSeatPrice,
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const FadeAnimation(
                    delay: 3.5,
                    fadeInDirection: FadeInDirection.ttb,
                    fadeOffset: 40,
                    child: LocationWidget()),
                FadeAnimation(
                  delay: 3.5,
                  fadeInDirection: FadeInDirection.ltr,
                  fadeOffset: 40,
                  child: SwiperWidget(
                      name: details.bookedMovieName,
                      date: formattedDate,
                      seat: ' j :3'),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.05,
                    ),
                    const Text(
                      'Upcoming',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                    height: height * 0.35,
                    width: width,
                    child: const UpcomingMoviesList()),
                SizedBox(
                  height: height * 0.03,
                ),
                StartButton(
                  backgroundColour: Colors.blue.shade50,
                  titleText: 'Payment',
                  fontColour: Colors.black,
                  onPressed: () {
                    Navigator.pushNamed(context, PaymentScreen.name,
                        arguments: details);
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }

  List<String> _getSelectedChairsLocations() {
    return details.bookedSeatLocations
        .map((chair) => '(${chair['row']! + 1}, ${chair['col']! + 1})')
        .toList();
  }
}
