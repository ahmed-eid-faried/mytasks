


import 'package:flutter/material.dart';
import 'package:mytasks/core/constant/color.dart';
import 'package:provider/provider.dart';

class CustomBackgroundAddTasks extends StatelessWidget {
  const CustomBackgroundAddTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AppColor>(
      builder: (context, appColor, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            gradient: SweepGradient(
              center: appColor.alignment2,
              colors: AppColor.generateGradient(100),
            ),
          ),
          height: double.infinity,
          width: double.infinity,
        );
      },
    );
  }
}
