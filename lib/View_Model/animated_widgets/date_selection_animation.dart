import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/View_Model/utilities/ui_colour.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/fade_animation.dart';

// ignore: must_be_immutable
class DateSelectionAnimation extends StatefulWidget {
  DateSelectionAnimation({super.key});
  int indexMin = 1;

  @override
  State<DateSelectionAnimation> createState() => _DateSelectionAnimationState();
}

class _DateSelectionAnimationState extends State<DateSelectionAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  int selectedIndex = 0;

  final List<Map<String, String>> dates = [
    {'day': '10', 'month': 'FEB'},
    {'day': '11', 'month': 'FEB'},
    {'day': '13', 'month': 'FEB'},
    {'day': '14', 'month': 'FEB'},
    {'day': '15', 'month': 'FEB'},
    {'day': '16', 'month': 'FEB'},
    {'day': '17', 'month': 'FEB'},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  void _onDateSelected(int index) {
    setState(() {
      selectedIndex = index;
      _scaleController.reset();
      _scaleController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.9,
      height: height * 0.13,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SizedBox(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dates.length,
                  padding: const EdgeInsets.all(5),
                  physics: const ScrollPhysics(
                      parent: BouncingScrollPhysics(
                          decelerationRate: ScrollDecelerationRate.normal)),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => _onDateSelected(index),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FadeAnimation(
                          delay: 1.5 * index,
                          fadeInDirection: FadeInDirection.ltr,
                          fadeOffset: 40,
                          child: AnimatedBuilder(
                            animation: _scaleController,
                            builder: (ctx, child) {
                              final scale = index == selectedIndex
                                  ? _scaleAnimation.value
                                  : 1.0;
                              return Transform.scale(
                                scale: scale,
                                child: child,
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: index == selectedIndex
                                    ? UiColour().listColourhighlight
                                    : UiColour().listColourbg,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: index == selectedIndex
                                    ? [
                                        BoxShadow(
                                          color: UiColour().listColourhighlight,
                                          spreadRadius: 1,
                                        )
                                      ]
                                    : [],
                                border: Border.all(
                                  color: UiColour().listColourbg,
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    dates[index]['day']!,
                                    style: TextStyle(
                                      color: UiColour().fontColoursecond,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    dates[index]['month']!,
                                    style: TextStyle(
                                      color: UiColour().fontColoursecond,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
