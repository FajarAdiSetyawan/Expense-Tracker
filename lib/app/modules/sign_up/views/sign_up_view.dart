import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:expense/app/theme/custom_button_style.dart';
import 'package:expense/app/theme/custom_text_filed.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light100,
      appBar: AppBar(
        title: Text(
          'lbl_sign_up'.tr,
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
                hintText: "lbl_name".tr,
              ),
              const SizedBox(
                height: 16,
              ),
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
              Row(
                children: [
                  Obx(
                    () => Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                        activeColor: violet100,
                        checkColor: Colors.white,
                        side: BorderSide(color: violet100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                        value: controller.isChecked.value,
                        onChanged: (value) => controller.toggleCheckbox(value!),
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "msg_by_signing_up_you".tr,
                          style: TextStyle(
                            color: dark75,
                            fontFamily: 'Inter',
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: 'msg_terms_of_service'.tr,
                          style: TextStyle(
                            color: violet100,
                            fontFamily: 'Inter',
                            fontSize: 15,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () => Get.defaultDialog(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                title: "lbl_sign_up".tr,
                colorBg: violet100,
                colorText: light100,
                colorRipple: Colors.black38,
                width: 400,
                onPressed: () => Get.toNamed(Routes.SIGN_UP_VERIFICATION),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "lbl_or_with".tr,
                  style: TextStyle(
                    color: dark25,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomButtonIcon(
                title: "msg_sign_up_with_google".tr,
                colorBg: light100,
                colorText: dark75,
                colorRipple: violet60,
                width: 400,
                svgPicture: SvgPicture.asset(
                  'assets/icons/ic_google.svg',
                  width: 24,
                  height: 24,
                ),
                onPressed: () => Get.toNamed(Routes.SIGN_UP),
              ),
              const SizedBox(
                height: 30,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "msg_already_have_an".tr,
                      style: TextStyle(
                        color: dark75,
                        fontFamily: 'Inter',
                        fontSize: 15,
                      ),
                    ),
                    TextSpan(
                      text: 'msg_login'.tr,
                      style: TextStyle(color: violet100, fontFamily: 'Inter', fontSize: 15, decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(Routes.LOGIN),
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
