import 'package:flutter/material.dart';

Widget circleBar(bool isActive) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 150),
    margin: const EdgeInsets.symmetric(horizontal: 8),
    height: isActive ? 12 : 8,
    width: isActive ? 12 : 8,
    decoration: BoxDecoration(
        color: isActive ? Colors.amber : Colors.black,
        borderRadius: const BorderRadius.all(Radius.circular(12))),
  );
}
