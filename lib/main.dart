import 'app/theme/theme_helper.dart';
import 'package:expense/app/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  int savedTheme = prefs.getInt('selectedTheme') ?? 1;
  ThemeMode initialThemeMode;

  print("$savedTheme");

  if (savedTheme == 1) {
    initialThemeMode = ThemeMode.light;
  } else if (savedTheme == 2) {
    initialThemeMode = ThemeMode.dark;
  } else {
    initialThemeMode = ThemeMode.system;
  }

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: initialThemeMode,
      darkTheme: darkAppThemeData,
      theme: appThemeData,
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: const Locale('en', 'US'),
      title: "lbl_app_name".tr,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
