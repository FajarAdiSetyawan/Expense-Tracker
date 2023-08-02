import 'package:get/get.dart';

class AddAccountController extends GetxController {
  //TODO: Implement AddAccountController

  var selectedOption = 'Options 1'.obs;

  void updateSelectedOption(String? newValue) {
    if (newValue != null) {
      selectedOption.value = newValue;
    }
  }
}
