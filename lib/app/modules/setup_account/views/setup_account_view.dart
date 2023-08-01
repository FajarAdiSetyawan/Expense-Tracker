import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:expense/app/theme/custom_button_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setup_account_controller.dart';

class SetupAccountView extends GetView<SetupAccountController> {
  const SetupAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light100,
      body: Padding(
        padding: const EdgeInsets.only(top: 140.0, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'msg_let_s_setup_your2'.tr,
              style: const TextStyle(
                fontSize: 30,
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'msg_account_can_be_your'.tr,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: "Inter",
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 30,
                  ),
                  child: CustomButton(
                    title: 'lbl_let_s_go'.tr,
                    colorBg: violet100,
                    colorText: violet20,
                    colorRipple: dark75,
                    width: 400,
                    onPressed: () => Get.toNamed(Routes.ADD_ACCOUNT),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
