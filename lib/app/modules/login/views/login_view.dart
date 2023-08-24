import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:expense/app/theme/custom_button_style.dart';
import 'package:expense/app/theme/custom_text_filed.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light100,
      appBar: AppBar(
        title: Text(
          'msg_login'.tr,
          style: const TextStyle(
            fontFamily: 'Intel',
            fontWeight: FontWeight.bold,
          ),
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
        surfaceTintColor: light100,
        backgroundColor: light100,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, right: 20, left: 20),
          child: Column(
            children: [
              CustomTextField(
                hintText: "lbl_email".tr,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                hintText: "lbl_password".tr,
                isPassword: true,
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                title: "msg_login".tr,
                colorBg: violet100,
                colorText: light100,
                colorRipple: Colors.black38,
                width: 400,
                onPressed: () => Get.toNamed(Routes.SIGN_UP),
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: GestureDetector(
                  onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                  child: Text(
                    "msg_forgot_password".tr,
                    style: TextStyle(
                      color: violet100,
                      fontFamily: "Inter",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "msg_don_t_have_an_account".tr,
                      style: TextStyle(
                        color: dark75,
                        fontFamily: 'Inter',
                        fontSize: 15,
                      ),
                    ),
                    TextSpan(
                      text: 'lbl_sign_up'.tr,
                      style: TextStyle(
                        color: violet100,
                        fontFamily: 'Inter',
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(Routes.SIGN_UP),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
