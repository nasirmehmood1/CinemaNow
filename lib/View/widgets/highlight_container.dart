import 'package:flutter/material.dart';

class HighlightContainer extends StatelessWidget {
  const HighlightContainer(
      {super.key,
      required this.primaryText,
      required this.secondaryText,
      required this.backgroundColour,
      required this.fontColour});
  final String primaryText;
  final String secondaryText;
  final Color backgroundColour;
  final Color fontColour;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * 0.05,
      width: width * 0.23,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColour,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(
            primaryText,
            style: TextStyle(
              color: fontColour,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            secondaryText,
            style: TextStyle(
              color: fontColour,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
