import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/View/screens/onboard_screen/on_board_page.dart';
import 'package:flutter_movie_ticketing_app/View/screens/payment_screen.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/athentication_animation.dart';
import 'package:flutter_movie_ticketing_app/View_Model/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: onGenerateRoute,
        initialRoute: OnBoardingPage.name,
        home: FingerScanAnimationDemo()
        // const OnBoardingPage()
        );
  }
}
