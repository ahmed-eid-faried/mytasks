// import 'package:mytasks/core/services/services.dart';
// import 'package:get/get.dart';

// translateLang(String arabic, String english) {
//   MyService myServices = Get.find();
//   String? lang;
//   lang = myServices.pref.getString("lang");
//   if (lang == "ar") {
//     return arabic;
//   } else {
//     return english;
//   }
// }

// translateMultiLang(List<TranslateMultiLangModel> listLang) {
//   MyService myServices = Get.find();
//   String? lang;
//   lang = myServices.pref.getString("lang");
//   for (int i = 0; i < listLang.length; i++) {
//     if (lang == listLang[i].langCode) {
//       return listLang[i].text;
//     }
//   }
// }

// class TranslateMultiLangModel {
//   String langCode;
//   String text;
//   TranslateMultiLangModel({
//     required this.langCode,
//     required this.text,
//   });
// }
