import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wz_translation/MyHomePage.dart';
import 'package:wz_translation/Common/app_theme.dart';
import 'package:wz_translation/wz_tabbar.dart';
import 'main.reflectable.dart';

void main() {

  initializeReflectable();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    theme: appThemeData,
    defaultTransition: Transition.fade,
    home: wz_tabbar(),
  ));
}

