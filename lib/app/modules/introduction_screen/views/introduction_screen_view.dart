import 'package:expense/app/core/constants/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/introduction_screen_controller.dart';

class IntroductionScreenView extends GetView<IntroductionScreenController> {
  const IntroductionScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
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
                _buildPageIndicator(),
                const SizedBox(height: 32),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                          letterSpacing: 4,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: violet20,
                    elevation: 0,
                  ),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: violet100,
                    ),
                  ),
                ),
                SizedBox(height: 30),
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
      children: <Widget>[
        Expanded(
          child: Container(
            width: 300,
            height: 300,
            child: Image.asset(slide.image, fit: BoxFit.contain),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Text(
            slide.heading,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(height: 230),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return GetBuilder<IntroductionScreenController>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            controller.slides.length,
            (index) => _buildPageIndicatorItem(index, controller.currentPage),
          ),
        );
      },
    );
  }

  Widget _buildPageIndicatorItem(int index, int currentPage) {
    double indicatorSize = index == currentPage ? 12 : 8; // Adjust the size here
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: indicatorSize,
        height: indicatorSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == currentPage ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}
