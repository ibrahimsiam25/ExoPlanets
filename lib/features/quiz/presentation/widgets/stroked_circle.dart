import 'package:flutter/material.dart';

class StrokedCircle extends StatelessWidget {
  final double radius;
  final double strokeWidth;
  final Color color;

  const StrokedCircle({
    super.key,
    required this.radius,
    required this.strokeWidth,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(radius * 2, radius * 2),
      painter: _CirclePainter(strokeWidth, color),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final double strokeWidth;
  final Color color;

  _CirclePainter(this.strokeWidth, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
