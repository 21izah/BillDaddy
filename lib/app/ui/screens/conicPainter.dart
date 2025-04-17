import 'package:flutter/material.dart';
import 'dart:math';

class ConicGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final Gradient gradient = SweepGradient(
      center: Alignment.center,
      startAngle: radians(190.53),
      endAngle: radians(550.53),
      colors: [
        Color(0xFF0085F3), // #0085F3
        Color.fromRGBO(0, 133, 243, 0.56), // rgba(0, 133, 243, 0.56)
      ],
      stops: [0.0, 1.0], // Define where the colors start/end
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    // Draw a rectangle instead of a circle to fill the Container's bounds
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  double radians(double degrees) {
    return degrees * pi / 180;
  }
}
