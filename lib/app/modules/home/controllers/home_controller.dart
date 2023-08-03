import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var _bottomNavIndex = 0.obs;
  int get bottomNavIndex => _bottomNavIndex.value;

  // A method to update the index
  void updateBottomNavIndex(int index) {
    _bottomNavIndex.value = index;
  }

  var isBottomBarVisible = true.obs; // Observable to track bottom bar visibility

  // Method to hide the bottom navigation bar after a delay
  void hideBottomBarAfterDelay() {
    isBottomBarVisible(false);
    Future.delayed(Duration(milliseconds: 2000), () {
      isBottomBarVisible(true);
    });
  }
}
