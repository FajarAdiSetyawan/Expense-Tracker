import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionScreenController extends GetxController {
  int currentPage = 0;
  PageController pageController = PageController();

  final slides = <Slide>[
    Slide("assets/images/onboarding_1.png", "msg_gain_total_control".tr, "msg_become_your_own".tr),
    Slide("assets/images/onboarding_2.png", "msg_know_where_your".tr, "msg_track_your_transaction".tr),
    Slide("assets/images/onboarding_3.png", "lbl_planning_ahead".tr, "msg_setup_your_budget".tr),
  ];

  @override
  void onInit() {
    pageController = PageController(initialPage: currentPage);
    pageController.addListener(_handlePageChange);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.removeListener(_handlePageChange);
    pageController.dispose();
    super.onClose();
  }

  void handlingOnPageChanged(int page) {
    currentPage = page;
    update();
  }

  void _handlePageChange() {
    currentPage = pageController.page!.round();
    update();
  }
}

class Slide {
  final String image;
  final String heading;
  final String description;

  Slide(this.image, this.heading, this.description);
}
