import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ChairWidget extends StatelessWidget {
  const ChairWidget({super.key, required this.chairColour});
  final Color chairColour;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;

    return Container(
      width: width * 0.3,
      height: height * 0.2,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Icon(
            Icons.chair_rounded,
            color: chairColour,
            size: 30,
          ),
        ),
      ),
    );
  }
}
