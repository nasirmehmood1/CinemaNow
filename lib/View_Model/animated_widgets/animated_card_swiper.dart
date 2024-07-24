import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_movie_ticketing_app/View/widgets/cinema_ticket.dart';

class SwiperWidget extends StatefulWidget {
  const SwiperWidget(
      {super.key, required this.name, required this.date, required this.seat});
  final String name;
  final String date;
  final String seat;

  @override
  State<SwiperWidget> createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  final CardSwiperController controllerCard = CardSwiperController();

  @override
  void dispose() {
    controllerCard.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.3,
      width: width,
      child: CardSwiper(
        allowedSwipeDirection: const AllowedSwipeDirection.all(),
        onSwipe: _onSwipe,
        onUndo: _onUndo,
        numberOfCardsDisplayed: 3,
        backCardOffset: const Offset(30, 15),
        padding: const EdgeInsets.all(24.0),
        controller: controllerCard,
        cardBuilder: (context, index, horizontalOffsetPercentage,
            verticalOffsetPercentage) {
          return CinemaTicket(
              movieName: widget.name,
              seatNumber: widget.seat,
              date: widget.date);
        },
        cardsCount: 5,
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}
