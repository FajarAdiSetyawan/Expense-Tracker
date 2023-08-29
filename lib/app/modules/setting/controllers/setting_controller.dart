import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
  RxInt selectedTheme = 1.obs;

  @override
  void onInit() {
    super.onInit();
    loadSavedTheme();
  }

  @override
  void onReady() {
    super.onReady();
    loadSavedTheme();
  }

  void loadSavedTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int savedTheme = prefs.getInt('selectedTheme') ?? 1;
    selectedTheme.value = savedTheme;

    update();
  }


}
