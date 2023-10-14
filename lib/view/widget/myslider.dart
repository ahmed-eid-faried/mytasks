import 'dart:async';
import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySlider extends StatelessWidget {
  const MySlider({super.key, required this.currentValue});
  final double currentValue;
  @override
  Widget build(BuildContext context) {
    final controller = ActionSliderController();
    return ActionSlider.custom(
      sliderBehavior: SliderBehavior.stretch,
      width: 300.0.w,
      controller: controller,
      height: 30.0.h,
      toggleWidth: (currentValue) * (300.0.w - 33.w),
      toggleMargin: EdgeInsets.zero,
      backgroundColor: Colors.green,
      foregroundChild: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.7),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: const Icon(Icons.check_rounded, color: Colors.white),
      ),
      foregroundBuilder: (context, state, child) => child!,
      outerBackgroundBuilder: (context, state, child) => Card(
        margin: EdgeInsets.zero,
        color: Color.lerp(
            Colors.white.withOpacity(0.3), Colors.green, state.position),
        child: Center(
          child: Text(state.position.toStringAsFixed(2)),
        ),
      ),
      backgroundBorderRadius: BorderRadius.circular(5.0.r),
      action: (controller) async {
        Timer.periodic(const Duration(seconds: 5), (timer) async {
          controller.loading();
          await Future.delayed(const Duration(seconds: 3));
          controller.success();
          await Future.delayed(const Duration(seconds: 1));
          controller.reset();
          // tasksNotifier.resetSlider(currentValue);
        });
      },
    );
  }
}
