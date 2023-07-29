import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionScreenController extends GetxController {
  int currentPage = 0;
  PageController pageController = PageController();

  final slides = <Slide>[
    Slide("assets/images/onboarding_1.png", "Plan trip to more than 90 countries"),
    Slide("assets/images/onboarding_2.png", "Hassle-free and quick flight booking"),
    Slide("assets/images/onboarding_3.png", "Real-time flight status to keep you informed"),
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

  Slide(this.image, this.heading);
}