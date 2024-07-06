import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/View/widgets/cinema_screen_painter.dart';

class CinemaScreenWidget extends StatefulWidget {
  @override
  _CinemaScreenWidgetState createState() => _CinemaScreenWidgetState();
}

class _CinemaScreenWidgetState extends State<CinemaScreenWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();

    _animation = Tween<double>(begin: 0.0, end: -10.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CinemaScreenPainter(arcHeight: _animation.value),
      child: const Center(
        child: Text(
          'Screen',
          style:
              TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
