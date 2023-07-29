import 'package:expense/app/core/constants/const_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: violet100,
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Center(
            child: Lottie.asset(
              "assets/lottie/splash_screen.json",
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
