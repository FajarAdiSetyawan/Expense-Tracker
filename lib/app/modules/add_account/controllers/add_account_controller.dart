import 'package:get/get.dart';

class AddAccountController extends GetxController {
  //TODO: Implement AddAccountController

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

  var selectedOption = 'Pilihan 1'.obs;

  void updateSelectedOption(String? newValue) {
    if (newValue != null) {
      selectedOption.value = newValue;
    }
  }
}
