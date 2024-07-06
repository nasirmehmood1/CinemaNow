import 'package:flutter/material.dart';

class HighlightedText extends StatelessWidget {
  const HighlightedText(
      {super.key,
      required this.titleText,
      required this.backgroundColour,
      required this.textColour});
  final String titleText;
  final Color backgroundColour;
  final Color textColour;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * 0.07,
      width: width * 0.25,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColour,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          titleText,
          style: TextStyle(
            color: textColour,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
