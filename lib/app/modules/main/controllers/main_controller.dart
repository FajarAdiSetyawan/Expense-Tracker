import 'package:get/get.dart';

class MainController extends GetxController {
  //TODO: Implement MainController

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
}
