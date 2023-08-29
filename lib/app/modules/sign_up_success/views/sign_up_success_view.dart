import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/sign_up_success_controller.dart';

class SignUpSuccessView extends GetView<SignUpSuccessController> {
  const SignUpSuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offNamed(Routes.MAIN);
      },
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Lottie.asset(
                "assets/lottie/success.json",
                fit: BoxFit.contain,
              ),
            ),
            Text(
              'lbl_you_are_set'.tr,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
