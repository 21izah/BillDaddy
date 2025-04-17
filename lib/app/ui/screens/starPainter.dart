import 'package:flutter/material.dart';
import 'dart:math';

class StarPainter extends CustomPainter {
  final Color color;

  StarPainter(this.color); // Pass the color via the constructor
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Create the path for the star
    Path path = Path();
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = size.width / 2;

    // Number of points for the star
    int points = 5;

    // Angle between star points
    double angle = 2 * pi / points;

    // Offset angle so the star is straight (starting point at the top)
    double startAngle = -pi / 2; // This makes the top point aligned straight up

    for (int i = 0; i < points; i++) {
      // Outer points (longer spikes)
      double outerX = centerX + radius * cos(startAngle + i * angle);
      double outerY = centerY + radius * sin(startAngle + i * angle);

      // Inner points (shorter spikes)
      double innerX =
          centerX + (radius / 2) * cos(startAngle + (i + 0.5) * angle);
      double innerY =
          centerY + (radius / 2) * sin(startAngle + (i + 0.5) * angle);

      if (i == 0) {
        path.moveTo(outerX, outerY); // Move to the first outer point
      } else {
        path.lineTo(outerX, outerY); // Connect outer points
      }
      path.lineTo(innerX, innerY); // Connect to inner points
    }

    path.close(); // Close the path to finish the star

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
