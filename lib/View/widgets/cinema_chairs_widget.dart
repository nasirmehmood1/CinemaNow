import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/fade_animation.dart';
import 'chair_widget.dart';

class CinemaChairsWidget extends StatefulWidget {
  const CinemaChairsWidget({Key? key}) : super(key: key);

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

  List<Map<String, int>> _selectedChairs = [];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
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
                                _selectedChairs.add({'row': i, 'col': x - 1});
                              } else if (_chairStatus[i][x - 1] == 4) {
                                _chairStatus[i][x - 1] = 1;
                                _selectedChairs.removeWhere((chair) =>
                                    chair['row'] == i && chair['col'] == x - 1);
                              }
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
          child: Text(
            'Total Price: \$${_calculateTotalPrice()}',
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
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
    for (var chair in _selectedChairs) {
      total += _getTicketPrice(_chairStatus[chair['row']!][chair['col']!]);
    }
    return total;
  }
}
