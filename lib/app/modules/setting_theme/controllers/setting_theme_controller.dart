import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingThemeController extends GetxController {
  RxInt selectedValue = 1.obs;

  @override
  void onInit() {
    super.onInit();

    // Schedule the theme change after the current build cycle
    Future.microtask(() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int savedTheme = prefs.getInt('selectedTheme') ?? 1;
      selectedValue.value = savedTheme;
      applySelectedTheme(savedTheme);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateSelectedValue(int? value) {
    if (value != null) {
      selectedValue.value = value;

      applySelectedTheme(value); // Apply the theme here
    }
  }

  void applySelectedTheme(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (value == 1) {
      Get.changeThemeMode(ThemeMode.light);
      prefs.setInt('selectedTheme', 1);
    } else if (value == 2) {
      Get.changeThemeMode(ThemeMode.dark);
      prefs.setInt('selectedTheme', 2);
    } else if (value == 3) {
      Get.changeThemeMode(ThemeMode.system);
      prefs.setInt('selectedTheme', 3);
    }
    update();
  }
}
