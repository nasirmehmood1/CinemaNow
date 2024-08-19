import 'package:flutter/material.dart';

class FaceScanAnimation extends StatefulWidget {
  final AnimationController controller;

  FaceScanAnimation({super.key, required this.controller});

  @override
  State<FaceScanAnimation> createState() => _FaceScanAnimationState();
}

class _FaceScanAnimationState extends State<FaceScanAnimation> {
  late Animation<double> heightAnimation;
  late Animation<double> borderWidth;

  @override
  void initState() {
    super.initState();
    heightAnimation = Tween<double>(begin: 0.0, end: 128.0).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: const Interval(
          0.0,
          0.500,
          curve: Curves.easeInOutSine,
        ),
      ),
    );
    borderWidth = Tween<double>(begin: 3.0, end: 7.0).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: const Interval(
          0.0,
          0.500,
          curve: Curves.easeInOutSine,
        ),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double height = constraints.maxHeight;
        final double width = constraints.maxWidth;
        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                bottom: 5,
                left: 20,
                child: SizedBox(
                  height: 120,
                  width: 200,
                  child: Image.asset(
                    'assets/images/faceid.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 20,
                child: Container(
                  width: 200,
                  height: heightAnimation.value,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.3),
                        blurRadius: 10,
                      ),
                    ],
                    border: Border(
                      top: BorderSide(
                        width: borderWidth.value,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
