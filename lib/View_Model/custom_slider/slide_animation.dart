import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_ticketing_app/Model/movie_lcard_model.dart';
import 'package:flutter_movie_ticketing_app/View/widgets/movie_card.dart';
import 'package:flutter_movie_ticketing_app/View/screens/movies_screens/movie_detail_screen.dart';
import 'package:flutter_movie_ticketing_app/View_Model/custom_slider/bloc/slider_bloc.dart';

class SliderAnimation extends StatefulWidget {
  const SliderAnimation({super.key, required this.list});
  final List<MoviecardModel> list;
  @override
  State<SliderAnimation> createState() => _SliderAnimationState();
}

class _SliderAnimationState extends State<SliderAnimation> {
  final _pageViewController = PageController(
    initialPage: 0,
    viewportFraction: 0.5,
    keepPage: true,
  );

  List myImagesList = [];

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);

    return BlocConsumer<SliderBloc, SliderState>(
      listener: (context, state) {},
      builder: (context, state) {
        int _currentIndex = state.slideIndex;

        return SizedBox(
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  height: height * 0.6,
                  width: width,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: PageView.builder(
                      controller: _pageViewController,
                      itemCount: listOfMovieCards.length,
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      onPageChanged: (index) {
                        BlocProvider.of<SliderBloc>(context)
                            .add(SlideChangeEvent(slideIndex: index));
                      },
                      itemBuilder: (context, index) {
                        final images = widget.list[index].backGroundImage;
                        final movieTitle = widget.list[index].movieTitile;
                        final movieType = widget.list[index].movieType;
                        final movieRating = widget.list[index].movieImbdRating;

                        var _scale = _currentIndex == index ? 1.0 : 0.7;
                        return TweenAnimationBuilder(
                            tween: Tween(begin: _scale, end: _scale),
                            duration: const Duration(milliseconds: 500),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, MovieDetailScreen.name,
                                      arguments: listOfMovieCards[index]);
                                },
                                child: MovieCard(
                                    title: movieTitle,
                                    image: images,
                                    movieType: movieType,
                                    movieRating: movieRating)),
                            builder: (context, double value, child) {
                              return Transform.scale(
                                scale: value,
                                child: child,
                              );
                            });
                      }),
                ),
              ),
              // Positioned(
              //     top: height * 0.28,
              //     left: width * 0.29,
              //     child: Container(
              //         alignment: AlignmentDirectional.topStart,
              //         child: Container(
              //             margin: const EdgeInsets.only(bottom: 35),
              //             child: Row(
              //               mainAxisSize: MainAxisSize.min,
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: <Widget>[
              //                 for (int i = 0; i < 5; i++)
              //                   if (i == _currentIndex) ...[
              //                     circleBar(true)
              //                   ] else
              //                     circleBar(false),
              //               ],
              //             ))))
            ],
          ),
        );
      },
    );
  }
}
