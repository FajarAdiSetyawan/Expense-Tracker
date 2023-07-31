import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:expense/app/theme/custom_button_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/introduction_screen_controller.dart';
import '../widgets/introduction_widget.dart';

class IntroductionScreenView extends GetView<IntroductionScreenController> {
  const IntroductionScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light100,
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.handlingOnPageChanged,
            physics: const BouncingScrollPhysics(),
            children: _buildSlides(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                IntroductionPageIndicator(controller: controller),
                const SizedBox(height: 50),
                CustomButton(
                  title: "lbl_sign_up".tr,
                  colorBg: violet100,
                  colorText: violet20,
                  colorRipple: Colors.black38,
                  onPressed: () => Get.toNamed(Routes.SIGN_UP),
                ),
                const SizedBox(height: 15),
                CustomButton(
                  title: "lbl_login".tr,
                  colorBg: violet20,
                  colorText: violet100,
                  colorRipple: violet60,
                  onPressed: () => Get.toNamed(Routes.LOGIN),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSlides() {
    return controller.slides.map((slide) => _buildSlide(slide)).toList();
  }

  Widget _buildSlide(Slide slide) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: SizedBox(
            width: 275,
            height: 275,
            child: Image.asset(slide.image, fit: BoxFit.contain),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                slide.heading,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                slide.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 260),
      ],
    );
  }
}
