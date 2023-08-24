import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:expense/app/theme/custom_button_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_success_controller.dart';

class ForgotPasswordSuccessView extends GetView<ForgotPasswordSuccessController> {
  const ForgotPasswordSuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 300,
              height: 300,
              child: Image.asset(
                'assets/images/ic_send_email.png',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'msg_your_email_is_on'.tr,
              style: const TextStyle(
                fontSize: 22,
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              textAlign: TextAlign.center,
              'msg_check_your_email'.tr,
              style: const TextStyle(
                fontFamily: "Inter",
                fontSize: 15,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 50,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    title: 'lbl_back_to_login'.tr,
                    colorBg: violet100,
                    colorText: violet20,
                    colorRipple: dark75,
                    onPressed: () => Get.toNamed(Routes.RESET_PASSWORD),
                    width: 350,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
