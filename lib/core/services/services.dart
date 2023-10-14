import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mytasks/core/constant/color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class MyService {
  late SharedPreferences pref;

  Future<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    handlingErrors();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    pref = await SharedPreferences.getInstance();
    await GetStorage.init();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
}

initService() async {
  final myService = MyService();
  await myService.init();
}

void handlingErrors() {
  RenderErrorBox.backgroundColor = AppColor.primaryColor;
  ErrorWidget.builder = (FlutterErrorDetails details) => Container();
}
