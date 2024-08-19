import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/View/screens/booking_screen.dart';
import 'package:flutter_movie_ticketing_app/View/screens/home_screen.dart';
import 'package:flutter_movie_ticketing_app/View/screens/movies_screen.dart';
import 'package:flutter_movie_ticketing_app/View/screens/payment_screen.dart';
import 'package:flutter_movie_ticketing_app/View_Model/utilities/ui_colour.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});
  static const String name = '/landing screen';

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;

  static const List<Widget> _bodyView = <Widget>[
    MyHomePage(),
    MoviesScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _bodyView.length);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController.animateTo(index);
    });
  }

  Widget _tabItem(Widget child, {bool isSelected = false}) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(4),
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 500),
      decoration: isSelected
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
            )
          : null,
      padding: const EdgeInsets.all(4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          child,
          const SizedBox(height: 4), // Add some spacing between icon and text
        ],
      ),
    );
  }

  final List<Widget> _icons = const [
    Icon(Icons.home_outlined),
    Icon(Icons.explore_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: TabBarView(
              controller: _tabController,
              children: _bodyView,
            ),
          ),
          Positioned(
            bottom: height * 0.01, // Adjusted position to the bottom
            left: width * 0.1,
            right: width * 0.1, // Centered horizontally
            child: Container(
              height: height * 0.1, // Adjusted height to avoid overflow
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(height * 0.04),
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  child: TabBar(
                    onTap: _onItemTapped,
                    labelColor: Colors.blueGrey,
                    unselectedLabelColor: UiColour().mirrorColour,
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide.none,
                    ),
                    tabs: List.generate(_icons.length, (index) {
                      return _tabItem(
                        _icons[index],
                        isSelected: index == _selectedIndex,
                      );
                    }),
                    controller: _tabController,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
