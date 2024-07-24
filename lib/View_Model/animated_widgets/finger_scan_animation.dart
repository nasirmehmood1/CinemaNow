import 'package:flutter/material.dart';

class FingerScanAnimation extends StatefulWidget {
  FingerScanAnimation({required this.controller})
      : height = Tween<double>(begin: 0.0, end: 128.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.0,
              0.500,
              curve: Curves.easeInOutSine,
            ),
          ),
        ),
        borderWidth = Tween<double>(begin: 3.0, end: 7.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.0,
              0.500,
              curve: Curves.easeInOutSine,
            ),
          ),
        ),
        super();

  final Animation<double> controller;
  final Animation<double> height;
  final Animation<double> borderWidth;

  @override
  State<FingerScanAnimation> createState() => _FingerScanAnimationState();
}

class _FingerScanAnimationState extends State<FingerScanAnimation> {
  // This function is called each time the controller "ticks" a new frame.
  Widget _buildAnimation(BuildContext context, Widget? child) {
    // <- Make `child` nullable
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: const Alignment(0, 0),
            children: <Widget>[
              const Icon(
                Icons.fingerprint,
                color: Colors.white,
                size: 128,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 128,
                  height: widget.height.value,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.3),
                        blurRadius: 10,
                      ),
                    ],
                    border: Border(
                      top: BorderSide(
                        width: widget.borderWidth.value,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: widget.controller,
    );
  }
}
