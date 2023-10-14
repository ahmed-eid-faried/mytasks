import 'package:mytasks/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Discount extends StatelessWidget {
  const Discount({
    super.key,
    required this.child,
    required this.discount,
    required this.text,
  });
  final Widget child;
  final double discount;
  final String text;

  @override
  Widget build(BuildContext context) {
    return discount != 0.0
        ? Stack(
            children: [
              child,
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 30),
                child: Transform.rotate(
                  angle: -math.pi / 4,
                  child: Container(
                      color: AppColor.primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          text,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      )
                      // child: Lottie.asset(AppImageAsset.search)
                      ),
                ),
              )
            ],
          )
        : child;
  }
}
