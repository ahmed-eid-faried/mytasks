

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytasks/core/constant/color.dart';
import 'package:mytasks/pathsinflutter.dart';
import 'package:provider/provider.dart';

class CustomPathsHome extends StatelessWidget {
  const CustomPathsHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AppColor>(builder: (context, appColor, child) {
      appColor.startAnimation();
      return Column(
        children: [
          SizedBox(
            height: 110.h,
            width: double.infinity,
            child: CustomPaint(
              size: const Size(200, 200),
              painter: WavyShapePainter(false),
            ),
          ),
          SizedBox(height: 485.h),
          SizedBox(
            height: 70.h,
            width: double.infinity,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationX(3.14159265),
              // تدوير 180 درجة حول المحور الأفقي
              child: CustomPaint(
                size: const Size(200, 200),
                painter: WavyShapePainter2(true),
              ),
            ),
          ),
        ],
      );
    });
  }
}
