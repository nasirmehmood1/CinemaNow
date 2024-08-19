import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/View_Model/utilities/ui_colour.dart';

class TabBarCustom extends StatefulWidget {
  const TabBarCustom({super.key});

  @override
  State<TabBarCustom> createState() => _TabBarCustomState();
}

class _TabBarCustomState extends State<TabBarCustom>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _bodyView = <Widget>[
    Text('Index 0: Home', style: optionStyle),
    Text('Index 1: Business', style: optionStyle),
    Text('Index 2: School', style: optionStyle),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _bodyView.length);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
              color: UiColour().homeColourOne,
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

  final List<String> _labels = ['Home', 'Maps', 'Camera'];
  final List<Widget> _icons = const [
    Icon(Icons.home_outlined),
    Icon(Icons.explore_outlined),
    Icon(Icons.person_2_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: _bodyView.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: height * 0.12, // Adjusted height to avoid overflow
        padding: const EdgeInsets.all(15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(height * 0.1),
          child: Container(
            color: UiColour().mirrorColour,
            child: TabBar(
              onTap: _onItemTapped,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.blueGrey,
              indicator: const UnderlineTabIndicator(),
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
    );
  }
}
