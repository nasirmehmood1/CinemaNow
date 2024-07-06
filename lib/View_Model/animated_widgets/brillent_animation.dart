import 'package:flutter/material.dart';

/// A widget that applies a combination of scale, rotation, fade, and color animations to its child.
class BrilliantGridAnimation extends StatefulWidget {
  final Widget child;
  final double delay;
  final double scaleFactor;
  final double fadeOffset;

  const BrilliantGridAnimation({
    super.key,
    required this.child,
    required this.delay,
    this.scaleFactor = 1.2,
    this.fadeOffset = 30.0,
  });

  @override
  State<BrilliantGridAnimation> createState() => _BrilliantGridAnimationState();
}

class _BrilliantGridAnimationState extends State<BrilliantGridAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;
  late Animation<Offset> offsetAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller with a duration based on the delay property.
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (500 * widget.delay).round()),
    );

    // Initialize the scale animation with a bounce effect.
    scaleAnimation = Tween<double>(begin: widget.scaleFactor, end: 1)
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.elasticOut,
    ));

    // Initialize the opacity animation from transparent to fully opaque.
    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );

    // Initialize the offset animation for fade effect.
    offsetAnimation =
        Tween<Offset>(begin: Offset(0, widget.fadeOffset), end: Offset.zero)
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    // Start the animations.
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: offsetAnimation.value,
          child: Transform.scale(
            scale: scaleAnimation.value,
            child: Opacity(
              opacity: opacityAnimation.value,
              child: widget.child,
            ),
          ),
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
