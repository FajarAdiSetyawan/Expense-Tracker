import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:expense/app/theme/custom_button_style.dart';
import 'package:expense/app/theme/custom_text_filed.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light100,
      appBar: AppBar(
        title: Text(
          'lbl_reset_password'.tr,
          style: const TextStyle(
            fontFamily: 'Intel',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          child: Image.asset(
            'assets/icons/ic_arrow_left.png',
            scale: 3,
          ),
          onTap: () => Get.back(),
        ),
        surfaceTintColor: light100,
        backgroundColor: light100,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, right: 20, left: 20),
          child: Column(
            children: [
              CustomTextField(
                hintText: "lbl_new_password".tr,
                isPassword: true,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                hintText: "msg_retype_new_password".tr,
                isPassword: true,
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                title: "lbl_continue".tr,
                colorBg: violet100,
                colorText: light100,
                colorRipple: Colors.black38,
                width: 400,
                onPressed: () => Get.toNamed(Routes.LOGIN),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
