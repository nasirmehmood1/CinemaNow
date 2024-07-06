import 'dart:math';

import 'package:flutter/material.dart';

class CinemaScreenPainter extends CustomPainter {
  final double arcHeight;

  CinemaScreenPainter({required this.arcHeight});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7.0;

    final path = Path();
    final arcRect =
        Rect.fromLTRB(0, arcHeight, size.width, size.height - arcHeight);

    path.moveTo(0, size.height / 2);
    path.arcTo(arcRect, pi, -pi, true);
    path.moveTo(0, size.height / 2);

    canvas.drawPath(path, paint);

    // Draw reflection
    final reflectionPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.red, Colors.transparent],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, size.height, size.width, size.height),
        reflectionPaint);
  }

  @override
  bool shouldRepaint(CinemaScreenPainter oldDelegate) {
    return oldDelegate.arcHeight != arcHeight;
  }
}
