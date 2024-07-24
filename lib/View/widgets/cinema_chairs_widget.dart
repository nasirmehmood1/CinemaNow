import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/Model/booking_model.dart';
import 'package:flutter_movie_ticketing_app/View/widgets/chair_widget.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/fade_animation.dart';
import 'dart:developer' as developer;

class CinemaChairsWidget extends StatefulWidget {
  final ValueNotifier<double> totalPriceNotifier;

  const CinemaChairsWidget({Key? key, required this.totalPriceNotifier})
      : super(key: key);

  @override
  State<CinemaChairsWidget> createState() => _CinemaChairsWidgetState();
}

class _CinemaChairsWidgetState extends State<CinemaChairsWidget> {
  final List<List<int>> _chairStatus = [
    [1, 3, 2, 1, 0, 2, 1],
    [1, 1, 0, 2, 1, 1, 2],
    [0, 2, 1, 1, 1, 2, 0],
    [2, 0, 2, 1, 2, 2, 1],
    [0, 3, 3, 2, 1, 1, 0],
    [0, 2, 1, 1, 1, 2, 0],
    [1, 3, 0, 1, 0, 2, 1]
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        for (int i = 0; i < _chairStatus.length; i++)
          Container(
            margin: EdgeInsets.only(
                top: i == 3 ? 20.0 : 0.0), // Adjust margin as needed
            child: FadeAnimation(
              delay: 0.5 * (i.toDouble()),
              fadeInDirection: FadeInDirection.ttb,
              fadeOffset: 40,
              child: Row(
                children: <Widget>[
                  for (int x = 0; x < _chairStatus[i].length + 2; x++)
                    if (x == 0 ||
                        x == _chairStatus[i].length + 1 ||
                        (i == 0 && (x == 1 || x == _chairStatus[i].length)) ||
                        (i == 3 && (x == 1 || x == _chairStatus[i].length)) ||
                        (i == 5 && (x == 1 || x == _chairStatus[i].length)))
                      SizedBox(
                        width: width * 0.08,
                      )
                    else
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_chairStatus[i][x - 1] == 1) {
                                _chairStatus[i][x - 1] = 4;
                                selectedChairs.add({'row': i, 'col': x - 1});
                              } else if (_chairStatus[i][x - 1] == 4) {
                                _chairStatus[i][x - 1] = 1;
                                selectedChairs.removeWhere((chair) =>
                                    chair['row'] == i && chair['col'] == x - 1);
                              }
                              widget.totalPriceNotifier.value =
                                  _calculateTotalPrice();
                            });
                          },
                          child: Container(
                            height: width / 10,
                            margin: const EdgeInsets.all(1),
                            child: ChairWidget(
                              chairColour:
                                  _getChairColor(_chairStatus[i][x - 1]),
                            ),
                          ),
                        ),
                      ),
                ],
              ),
            ),
          ),
        SizedBox(
          height: height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ValueListenableBuilder<double>(
            valueListenable: widget.totalPriceNotifier,
            builder: (context, totalPrice, child) {
              return Column(
                children: [
                  Text(
                    'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  // if (selectedChairs.isNotEmpty)
                  //   Text(
                  //     'Selected Chairs: ${_getSelectedChairsLocations()}',
                  //     style: const TextStyle(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.black),
                  //     textAlign: TextAlign.center,
                  //   ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Color _getChairColor(int status) {
    switch (status) {
      case 1:
        return Colors.black12;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.red;
      case 4:
        return Colors.orange;
      default:
        return Colors.green;
    }
  }

  double _getTicketPrice(int status) {
    switch (status) {
      case 1:
        return 10.0;
      case 2:
        return 15.0;
      case 3:
        return 20.0;
      case 4:
        return 12.0;
      default:
        return 0.0;
    }
  }

  double _calculateTotalPrice() {
    double total = 0.0;
    for (var chair in selectedChairs) {
      total += _getTicketPrice(_chairStatus[chair['row']!][chair['col']!]);
    }
    return total;
  }

  String _getSelectedChairsLocations() {
    return selectedChairs
        .map((chair) => '(${chair['row']! + 1}, ${chair['col']! + 1})')
        .join(', ');
  }
}
