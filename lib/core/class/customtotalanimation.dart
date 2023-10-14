// import 'dart:async';
// import 'dart:math' as math;
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomTotalAnimation extends StatelessWidget {
//   const CustomTotalAnimation({
//     super.key,
//     required this.child,
//     this.animation = true,
//   });
//   final Widget child;
//   final bool animation;

//   @override
//   Widget build(BuildContext context) {
//     CustomTotalAnimationControllerImp controller =
//         Get.put(CustomTotalAnimationControllerImp());
//     if (animation) {
//       controller.startAnimation();
//     }
//     return GetBuilder<CustomTotalAnimationControllerImp>(builder: (controller) {
//       return Stack(
//         children: [
//           Center(
//             child: AnimatedOpacity(
//               opacity: controller.opacity,
//               duration: const Duration(seconds: 1),
//               curve: Curves.bounceOut,
//               child: Transform.scale(
//                   scale: controller.scale,
//                   child: Transform.rotate(
//                     angle: math.pi / controller.angle,
//                     child: AnimatedContainer(
//                       duration: const Duration(seconds: 1),
//                       curve: Curves.easeInCirc,
//                       width: controller.width,
//                       height: controller.height,
//                       decoration: BoxDecoration(
//                           color: controller.color,
//                           borderRadius:
//                               BorderRadius.circular(controller.radius)),
//                     ),
//                   )),
//             ),
//           ),
//           child
//         ],
//       );
//     });
//   }
// }

// class CustomTotalAnimationControllerImp extends GetxController {
//   double width = 150;
//   double height = 150;
//   Color color = Colors.blue;
//   double radius = 30;
//   double opacity = 1;
//   double padding = 10;
//   double scale = 0.5;
//   double angle = 4;
//   bool status = true;
//   animation() {
//     final random = Random();
//     opacity = random.nextDouble() * 0.7; //0.0=>0.7
//     padding = random.nextDouble() * 100;
//     width = random.nextDouble() * 400 + 100;
//     height = random.nextDouble() * 400 + 100;
//     color = Color.fromRGBO(
//       random.nextInt(256),
//       random.nextInt(256),
//       random.nextInt(256),
//       1,
//     );
//     radius = random.nextDouble() * 200;
//     scale = random.nextDouble() * 2;
//     angle = random.nextDouble() * pi * 2;
//   }

//   void startAnimation() {
//     if (status) {
//       Timer.periodic(const Duration(seconds: 1), (Timer timer) {
//         animation();
//         update();
//       });
//     }
//   }

//   @override
//   void onInit() {
//     animation();
//     if (status == true) {
//       Timer.periodic(const Duration(seconds: 1), (Timer timer) {
//         animation();
//         update();
//       });
//     }

//     super.onInit();
//   }
// }
