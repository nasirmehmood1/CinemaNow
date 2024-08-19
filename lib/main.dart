import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/View/screens/on_board_page.dart';
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
        home: const OnBoardingPage());
  }
}
