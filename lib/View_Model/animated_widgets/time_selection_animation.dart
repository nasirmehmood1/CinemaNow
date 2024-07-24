import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/fade_animation.dart';

class TimeSelectionAnimation extends StatefulWidget {
  const TimeSelectionAnimation({super.key});

  @override
  State<TimeSelectionAnimation> createState() => _TimeSelectionAnimationState();
}

class _TimeSelectionAnimationState extends State<TimeSelectionAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  int selectedIndex = 0;

  final List<Map<String, String>> dates = [
    {'day': '10:00', 'meridiem': 'AM'},
    {'day': '11:30', 'meridiem': 'PM'},
    {'day': '1:30', 'meridiem': 'PM'},
    {'day': '4:30', 'meridiem': 'PM'},
    {'day': '8:30', 'meridiem': 'PM'},
    {'day': '10:30', 'meridiem': 'PM'},
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

    return Center(
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Container(
          width: width * 0.9,
          height: height * 0.1,
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dates.length,
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
                                    ? Colors.green.shade200
                                    : Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    dates[index]['day']!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.none,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  Text(
                                    dates[index]['meridiem']!,
                                    style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 12,
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
