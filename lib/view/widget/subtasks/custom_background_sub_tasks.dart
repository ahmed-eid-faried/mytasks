import 'package:flutter/material.dart';
import 'package:mytasks/core/constant/color.dart';
import 'package:provider/provider.dart';

class CustomBackgroundSubTasks extends StatelessWidget {
  const CustomBackgroundSubTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AppColor>(builder: (context, appColor, child) {
      appColor.startAnimation();
      return AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          gradient: RadialGradient(
            center: appColor.alignment,
            colors: AppColor.generateGradient(20),
          ),
        ),
        height: double.infinity,
        width: double.infinity,
      );
    });
  }
}
