// import 'package:mytasks/core/constant/imgaeasset.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';

// class LottileBackground extends StatelessWidget {
//   const LottileBackground({
//     super.key,
//     this.beforeChild,
//     this.afterChild,
//   });
//   final Widget? beforeChild;
//   final Widget? afterChild;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         beforeChild ?? const Text(""),
//         Center(
//             child: SizedBox(
//           width: 0.5 * Get.width,
//           child: AnimatedOpacity(
//               opacity: 0.3,
//               duration: const Duration(milliseconds: 900),
//               child: Lottie.asset(AppImageAsset.search)),
//         )),
//         afterChild ?? const Text(""),
//       ],
//     );
//   }
// }
