import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:expense/app/theme/custom_button_style.dart';
import 'package:expense/app/theme/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'lbl_forgot_password'.tr,
        ),
        centerTitle: true,
        leading: GestureDetector(
          child: Transform.scale(
            scale: 0.7,
            child: SvgPicture.asset(
              'assets/icons/ic_arrows_left.svg',
            ),
          ),
          onTap: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40.0,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Text(
              'msg_don_t_worry_enter'.tr,
              style: const TextStyle(
                fontSize: 23,
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              hintText: 'lbl_email'.tr,
              autocorrect: false,
              autofocus: false,
              enableSuggestions: false,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              title: 'lbl_continue'.tr,
              colorBg: violet100,
              colorText: violet20,
              colorRipple: dark75,
              width: 400,
              onPressed: () => Get.toNamed(
                Routes.FORGOT_PASSWORD_SUCCESS,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
