import 'package:get/get.dart';

import '../controllers/setting_theme_controller.dart';

class SettingThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingThemeController>(
      () => SettingThemeController(),
    );
  }
}
