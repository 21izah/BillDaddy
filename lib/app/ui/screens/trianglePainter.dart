import 'package:flutter/material.dart';
import 'dart:math';

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter(this.color); // Pass the color via the constructor
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill; // Fill the triangle

    // Save the canvas state before applying transformation
    canvas.save();

    // Move the origin to the center of the canvas before rotation
    canvas.translate(size.width / 2, size.height / 2);

    // Rotate the canvas by 90 degrees (pi/2 radians)
    canvas.rotate(pi);

    // After rotation, translate back to top-left
    canvas.translate(-size.width / 2, -size.height / 2);

    Path path = Path();

    // Define the three points of the triangle
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = size.width / 2;

    // The three vertices of the triangle
    Offset point1 = Offset(centerX, centerY - radius); // Top center
    Offset point2 = Offset(centerX - radius, centerY + radius); // Bottom left
    Offset point3 = Offset(centerX + radius, centerY + radius); // Bottom right

    // Move to the first point
    path.moveTo(point1.dx, point1.dy);

    // Draw lines to the other two points
    path.lineTo(point2.dx, point2.dy);
    path.lineTo(point3.dx, point3.dy);

    // Close the path (connect the last point to the first)
    path.close();

    // Draw the triangle
    canvas.drawPath(path, paint);

    // Restore the canvas to its original state
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
