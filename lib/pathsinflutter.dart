// https://medium.com/flutter-community/paths-in-flutter-a-visual-guide-6c906464dcd0

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytasks/core/constant/color.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomPaint(
            size: const Size(200, 200), // Adjust the size as needed
            painter: WavyShapePainter(true),
          ),
          CustomPaint(
            size: const Size(200, 200),
            painter: MyPainter1(),
          ),
          CustomPaint(
            size: const Size(200, 200),
            painter: MyPainter2(),
          ),
          CustomPaint(
            size: const Size(200, 200),
            painter: MyPainter3(),
          ),
          CustomPaint(
            size: const Size(200, 200),
            painter: MyPainter4(),
          ),
          CustomPaint(
            size: const Size(200, 200),
            painter: MyPainter5(),
          ),
          CustomPaint(
            size: const Size(200, 200),
            painter: MyPainter6(),
          ),
          CustomPaint(
            size: const Size(200, 200),
            painter: MyPainter7(),
          ),
          CustomPaint(
            size: const Size(200, 200),
            painter: MyPainter8(),
          ),
          CustomPaint(
            size: const Size(200, 200),
            painter: MyPainter9(),
          ),
          CustomPaint(
            size: const Size(200, 200),
            painter: MyPainter10(),
          ),
          CustomPaint(
            size: const Size(200, 200),
            painter: MyPainter11(),
          ),
          CustomPaint(
            size: const Size(200, 200),
            painter: MyPainter12(),
          ),
          CustomPaint(
            size: const Size(200, 200),
            painter: MyPainter13(),
          ),
          CustomPaint(
            size: const Size(200, 200),
            painter: MyPainter14(),
          ),
          CustomPaint(
            size: const Size(200, 200),
            painter: MyPainter15(),
          ),
          CustomPaint(
            size: const Size(200, 200),
            painter: MyPainter16(),
          ),
        ],
      ),
    );
  }
}

abstract class MyPainter extends CustomPainter {
  Paint kpaint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeWidth = 8.0.w;
  Paint kpaint1 = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.fill
    ..strokeWidth = 8.0.w;
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomPainter oldDelegate) => false;
}

class MyPainter1 extends MyPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(const Offset(10, 10), 50, kpaint1);
  }
}

class MyPainter2 extends MyPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.cubicTo(size.width / 4, 3 * size.height / 4, 3 * size.width / 4,
        size.height / 4, size.width, size.height);
    canvas.drawPath(path, kpaint1);
  }
}

class MyPainter3 extends MyPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height / 2);
    canvas.drawPath(path, kpaint1);
  }
}

class MyPainter4 extends MyPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    // Draws a line from left top corner to right bottom
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, kpaint);
  }
}

class MyPainter5 extends MyPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.conicTo(
        size.width / 4, 3 * size.height / 4, size.width, size.height, 20);
    canvas.drawPath(path, kpaint);
  }
}

class MyPainter6 extends MyPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Method to convert degree to radians
    num degToRad(num deg) => deg * (math.pi / 180.0);

    Path path = Path();
    path.arcTo(
        Rect.fromLTWH(
            size.width / 2, size.height / 2, size.width / 4, size.height / 4),
        0,
        90,
        true);
    canvas.drawPath(path, kpaint);
  }
}

class MyPainter7 extends MyPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    // Adds a rectangle
    path.addRect(Rect.fromLTWH(
        size.width / 2, size.height / 2, size.width / 4, size.height / 4));
    canvas.drawPath(path, kpaint);
  }
}

class MyPainter8 extends MyPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Method to convert degree to radians
    num degToRad(num deg) => deg * (math.pi / 180.0);

    Path path = Path();
    // Adds a quarter arc
    path.addArc(Rect.fromLTWH(0, 0, size.width, size.height), 180, 90);
    canvas.drawPath(path, kpaint);
  }
}

class MyPainter9 extends MyPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    // Adds an oval
    path.addOval(Rect.fromLTWH(
        size.width / 2, size.height / 2, size.width / 4, size.height / 4));
    canvas.drawPath(path, kpaint);
  }
}

class MyPainter10 extends MyPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    // Adds a polygon from the starting point to quarter point of the screen and lastly
    // it will be in the bottom middle. Close method will draw a line between start and end.
    path.addPolygon([
      Offset.zero,
      Offset(size.width / 4, size.height / 4),
      Offset(size.width / 2, size.height)
    ], true);
    canvas.drawPath(path, kpaint);
  }
}

class MyPainter11 extends MyPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(
            size.width / 2, size.height / 2, size.width / 4, size.height / 4),
        const Radius.circular(16)));
    canvas.drawPath(path, kpaint);
  }
}

class MyPainter12 extends MyPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(
            size.width / 2, size.height / 2, size.width / 4, size.height / 4),
        const Radius.circular(16)));
    Path secondPath = Path();
    secondPath.lineTo(size.width / 2, size.height / 2);
    path.addPath(secondPath, const Offset(16, 16));
    canvas.drawPath(path, kpaint);
  }
}

class MyPainter13 extends MyPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width / 4, size.height / 4);
    path.relativeLineTo(size.width / 2, size.height / 2);
    canvas.drawPath(path, kpaint);
  }
}

class MyPainter14 extends MyPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width / 4, size.height / 4);
    path.relativeQuadraticBezierTo(
        size.width / 2, size.height, size.width, size.height / 2);
    canvas.drawPath(path, kpaint);
  }
}

class MyPainter15 extends MyPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width / 4, size.height / 4);
    path.relativeConicTo(
        size.width / 4, 3 * size.height / 4, size.width, size.height, 20);
    canvas.drawPath(path, kpaint);
  }
}

class MyPainter16 extends MyPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width / 4, size.height / 4);
    path.relativeCubicTo(size.width / 4, 3 * size.height / 4,
        3 * size.width / 4, size.height / 4, size.width, size.height);
    canvas.drawPath(path, kpaint);
  }
}

class WavyShapePainter extends CustomPainter {
  WavyShapePainter(this.opacity);
  final bool opacity;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColor.primaryColor.withOpacity(opacity ? 0.3 : 1)
      ..style = PaintingStyle.fill;

    final path = Path();

    // Starting point
    path.moveTo(0, size.height);

    // Create a wavy shape using curves
    path.quadraticBezierTo(
        size.width * 0.25, size.height - 30, size.width * 0.5, size.height);
    path.quadraticBezierTo(
        size.width * 0.75, size.height + 30, size.width, size.height);

    // Close the path to create a shape
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    // Draw the path on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class WavyShapePainter2 extends CustomPainter {
  WavyShapePainter2(this.opacity);
  final bool opacity;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColor.primaryColor.withOpacity(opacity ? 0.3 : 1)
      ..style = PaintingStyle.fill;

    final path = Path();

    // Starting point
    path.moveTo(0, size.height);

    // Create a wavy shape using curves
    path.quadraticBezierTo(
        size.width * 0.2, size.height - 40, size.width * 0.4, size.height - 20);
    path.quadraticBezierTo(
        size.width * 0.6, size.height, size.width * 0.8, size.height - 20);
    path.quadraticBezierTo(
        size.width * 1.0, size.height - 40, size.width * 1.0, size.height - 20);

    // Close the path to create a shape
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    // Draw the path on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
