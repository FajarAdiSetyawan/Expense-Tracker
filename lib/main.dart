import 'package:expense/app/localization/app_localization.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: "Expesnse Tracker",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}