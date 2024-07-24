import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_ticketing_app/View/screens/Landing_screen/landing_screen.dart';
import 'package:flutter_movie_ticketing_app/View/screens/booking_screen/booking_screen.dart';
import 'package:flutter_movie_ticketing_app/View/screens/home_screen/home_screen.dart';
import 'package:flutter_movie_ticketing_app/View/screens/movies_screens/movie_detail_screen.dart';
import 'package:flutter_movie_ticketing_app/View/screens/movies_screens/movies_screen.dart';
import 'package:flutter_movie_ticketing_app/View/screens/onboard_screen/on_board_page.dart';
import 'package:flutter_movie_ticketing_app/View/screens/payment_screen.dart';
import 'package:flutter_movie_ticketing_app/View/screens/ticketing_screen/ticket_screen.dart';
import 'package:flutter_movie_ticketing_app/View_Model/custom_slider/bloc/slider_bloc.dart';

class SlideTransitionPageRoute extends PageRouteBuilder {
  final Widget page;

  SlideTransitionPageRoute(
      {required this.page, required RouteSettings settings})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve),
            );

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardingPage.name:
      return SlideTransitionPageRoute(
          page: const OnBoardingPage(), settings: settings);
    case LandingScreen.name:
      return SlideTransitionPageRoute(
          page: BlocProvider(
            create: (context) => SliderBloc(),
            child: const LandingScreen(),
          ),
          settings: settings);
    case MyHomePage.name:
      return SlideTransitionPageRoute(
          page: BlocProvider(
            create: (context) => SliderBloc(),
            child: const MyHomePage(),
          ),
          settings: settings);
    case MoviesScreen.name:
      return MaterialPageRoute(
          builder: (context) {
            return const MoviesScreen();
          },
          settings: RouteSettings(arguments: settings.arguments));
    case MovieDetailScreen.name:
      return MaterialPageRoute(
          builder: (context) {
            return const MovieDetailScreen();
          },
          settings: RouteSettings(arguments: settings.arguments));
    case BookingScreen.name:
      return MaterialPageRoute(
          builder: (context) {
            return const BookingScreen();
          },
          settings: RouteSettings(arguments: settings.arguments));
    case TicketScreen.name:
      return MaterialPageRoute(
          builder: (context) {
            return const TicketScreen();
          },
          settings: RouteSettings(arguments: settings.arguments));
    case PaymentScreen.name:
      return MaterialPageRoute(
          builder: (context) {
            return const PaymentScreen();
          },
          settings: RouteSettings(arguments: settings.arguments));

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Page not found'),
          ),
          body: const Center(
            child: Text('Page not found'),
          ),
        ),
      );
  }
}
