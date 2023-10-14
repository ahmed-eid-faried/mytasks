// import 'package:mytasks/core/constant/color.dart';
// import 'package:mytasks/core/constant/sizes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ShowSize extends StatelessWidget {
//   const ShowSize({Key? key, required this.child}) : super(key: key);
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     Get.put(ShowSizeController());
//     return Scaffold(
//       body: GetBuilder<ShowSizeController>(
//         builder: (controller) => SizedBox(
//           width: double.infinity,
//           height: double.infinity,
//           child: Stack(
//             children: [
//               child,
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Center(child: Text("width:- ${Get.width}")),
//                     Center(child: Text("height:- ${Get.height}")),
//                     Center(child: Text("pixelRatio:- ${Get.pixelRatio}")),
//                     SizedBox(
//                       width: Get.width * 0.35,
//                       height: Get.height * 0.05,
//                       child: MaterialButton(
//                         textColor: Colors.white,
//                         color: AppColor.primaryColor,
//                         onPressed: () {
//                           controller.refreshScreen();
//                         },
//                         child: const Text("refresh"),
//                       ),
//                     ),
//                     TextFormField(
//                       controller: controller.controller,
//                       decoration: const InputDecoration(
//                           labelText: "dimension", border: OutlineInputBorder()),
//                     ),
//                     SizedBox(
//                       width: Get.width * 0.35,
//                       height: Get.height * 0.05,
//                       child: MaterialButton(
//                         textColor: Colors.white,
//                         color: AppColor.primaryColor,
//                         onPressed: () {
//                           controller.convert();
//                         },
//                         child: const Text("convert size"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ShowSizeController extends GetxController {
//   TextEditingController? controller;
//   Appsize size = Appsize();

//   convert() {
//     size = Appsize();
//     double doubleValue = double.tryParse(controller!.text) ?? 0.0;
//     double resultOfHeight = ((100 * doubleValue) / Get.height);
//     double resultOfWidth = (100 * doubleValue) / Get.width;
//     Get.defaultDialog(
//       title: "convert size",
//       middleText:
//           "width:- ${resultOfWidth.round()} * wp &&&  height:- ${resultOfHeight.round()} * hp ",
//     );
//   }

//   refreshScreen() {
//     size = Appsize();
//     update();
//   }

//   @override
//   void onInit() {
//     controller = TextEditingController();
//     super.onInit();
//   }
// }
