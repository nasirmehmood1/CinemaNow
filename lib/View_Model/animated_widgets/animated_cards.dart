import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/Model/image_poster_model.dart';
import 'package:flutter_movie_ticketing_app/View/widgets/image_widget.dart';

class AnimatedRotatedCards extends StatefulWidget {
  const AnimatedRotatedCards({
    super.key,
  });

  @override
  State<AnimatedRotatedCards> createState() => _AnimatedRotatedCardsState();
}

class _AnimatedRotatedCardsState extends State<AnimatedRotatedCards>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> _positionAnimation;
  late Animation<double> _altPositionAnimation;
  late ScrollController _listCtrl;

  @override
  void initState() {
    super.initState();

    _listCtrl = ScrollController();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _positionAnimation = Tween<double>(begin: 100, end: 0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut,
      ),
    );

    _altPositionAnimation = Tween<double>(begin: -100, end: 0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut,
      ),
    );

    animationController.forward();

    Future.delayed(Duration.zero, () {
      _listCtrl.animateTo(
        300,
        duration: const Duration(seconds: 6),
        curve: Curves.decelerate,
      );
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    _listCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return SingleChildScrollView(
          child: Column(
            children: List.generate(3, (index) {
              final start = index * 3;
              final end = min(start + 7, listOfPosterImages.length);

              // Ensure the start index is valid
              if (start >= listOfPosterImages.length) {
                return SizedBox
                    .shrink(); // Return an empty widget if start is out of range
              }

              final listGames = listOfPosterImages.sublist(start, end);

              return SizedBox(
                height: height * 0.2, // Constrain the height
                child: Transform.rotate(
                  angle: pi * 0.07,
                  child: Transform.translate(
                    offset: Offset(
                      (index == 1)
                          ? _altPositionAnimation.value
                          : _positionAnimation.value,
                      0,
                    ),
                    child: SizedBox(
                      height: height * 0.2, // Constrain the height
                      child: SingleChildScrollView(
                        controller: _listCtrl,
                        reverse: (index == 1) ? true : false,
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        child: Row(
                          children: List.generate(listGames.length, (index) {
                            return ImageWidget(
                              imagePath: listGames[index],
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
