import 'package:expense/app/core/constants/const_colors.dart';
import 'package:flutter/material.dart';
import '../controllers/introduction_screen_controller.dart';
import 'package:get/get.dart';

class IntroductionPageIndicator extends StatelessWidget {
  final IntroductionScreenController controller;

  const IntroductionPageIndicator({super.key, required this.controller});

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
    double indicatorSize = index == currentPage ? 15 : 8; // Adjust the size here
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: indicatorSize,
        height: indicatorSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == currentPage ? violet100 : violet20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPageIndicator();
  }
}
