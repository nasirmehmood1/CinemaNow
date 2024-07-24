import 'dart:ffi';

import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double widht = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * 0.035,
      width: widht * 0.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widht * 0.2),
          color: Colors.white),
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: widht * 0.05,
                ),
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.blueAccent,
                  size: 25,
                ),
                SizedBox(
                  width: widht * 0.02,
                ),
                const Text(
                  'Universal Cinema',
                  style: TextStyle(
                      color: Colors.blueAccent, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
