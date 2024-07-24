import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/finger_scan_animation.dart';

class FingerScanAnimationDemo extends StatefulWidget {
  @override
  _FingerScanAnimationDemoState createState() =>
      _FingerScanAnimationDemoState();
}

class _FingerScanAnimationDemoState extends State<FingerScanAnimationDemo>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 750), vsync: this);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: 256,
          width: 256,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              stops: [0.2, 0.1, 0.5, 0.8],
              focal: AlignmentDirectional.center,
              colors: [
                Color.fromRGBO(56, 6, 107, 5),
                Color.fromRGBO(39, 7, 103, 5),
                Color.fromRGBO(80, 5, 109, 1),
                Color.fromRGBO(56, 6, 107, 5),
              ],
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 16,
                spreadRadius: 2,
                color: Color.fromRGBO(39, 7, 103, 5),
              )
            ],
          ),
          child: FingerScanAnimation(
            controller: _controller,
          ),
        ),
      ),
    );
  }
}
