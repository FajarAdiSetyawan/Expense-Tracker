import 'dart:async';

import 'package:expense/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController

  @override
  void onReady() {
    super.onReady();
    loading();
  }

  Future<void> loading() async {
    Timer(const Duration(seconds: 3), () {
      Get.offAndToNamed(Routes.INTRODUCTION_SCREEN);
    });
  }
}
