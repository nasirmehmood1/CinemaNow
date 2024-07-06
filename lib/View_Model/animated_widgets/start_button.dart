import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/View/screens/Landing_screen/landing_screen.dart';
import 'package:flutter_movie_ticketing_app/View/screens/home_screen/home_screen.dart';

class StartButton extends StatefulWidget {
  const StartButton(
      {super.key,
      required this.backgroundColour,
      required this.titleText,
      required this.fontColour,
      this.onPressed});
  final Color backgroundColour;
  final String titleText;
  final Color fontColour;
  final Function()? onPressed;
  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController widthController;
  late Animation<Offset> positionAnimation;
  late Animation<double> widthAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    widthController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1300));
    positionAnimation =
        Tween(begin: const Offset(0, 8), end: const Offset(0, 0)).animate(
            CurvedAnimation(
                parent: animationController,
                curve: const ElasticOutCurve(2.5)));
    widthAnimation = Tween(begin: 50.5, end: 500.0).animate(
        CurvedAnimation(parent: widthController, curve: Curves.elasticInOut));

    // Defer animation start until after layout
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        widthAnimation = Tween(
          begin: 50.5,
          end: MediaQuery.of(context).size.width - 32.0,
        ).animate(
          CurvedAnimation(parent: widthController, curve: Curves.elasticInOut),
        );

        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) {
            animationController.forward().then((onValue) {
              Future.delayed(
                  const Duration(
                    milliseconds: 300,
                  ), () {
                if (mounted) {
                  widthController.forward();
                }
              });
            });
          }
        });
      });
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    widthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SlideTransition(
      position: positionAnimation,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedBuilder(
          animation: widthAnimation,
          builder: (context, child) {
            return SizedBox(
              width: widthAnimation.value,
              height: height * 0.07,
              child: ElevatedButton(
                onPressed: widget.onPressed,
                style: ElevatedButton.styleFrom(
                    backgroundColor: widget.backgroundColour),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: widthAnimation.value > 200 ? 1 : 0,
                  child: Text(
                    widget.titleText,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: widget.fontColour),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
