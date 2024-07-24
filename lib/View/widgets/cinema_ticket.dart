import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/View/utilities/ui_colour.dart';

class CinemaTicket extends StatelessWidget {
  const CinemaTicket(
      {super.key,
      required this.movieName,
      required this.seatNumber,
      required this.date});
  final String movieName;
  final String seatNumber;
  final String date;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Center(
      child: Container(
        width: width,
        height: height * 0.22,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: height * 0.03,
                            width: width,
                            decoration: BoxDecoration(
                                color: UiColour().onboardColourOne),
                            child: const Center(
                              child: Text(
                                'TN :123',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.event_seat,
                            size: 40,
                            color: UiColour().onboardColourOne,
                          ),
                          Text(
                            'THEATER: 1\nSEAT: $seatNumber\nDATE: $date',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: UiColour().bgOne,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.grey,
                    thickness: 3,
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: height * 0.03,
                              width: width,
                              decoration: BoxDecoration(
                                  color: UiColour().onboardColourOne),
                              child: const Center(
                                child: Text(
                                  'MOVIE TICKET',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            movieName,
                            style: TextStyle(
                              fontSize: 20,
                              color: UiColour().onboardColourOne,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'NO. 00000000',
                            style: TextStyle(
                              fontSize: 14,
                              color: UiColour().onboardColourOne,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'S:$seatNumber',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: UiColour().onboardColourOne,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.4,
                                height: height * 0.06,
                                child: Image.asset(
                                  'assets/images/bar.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
