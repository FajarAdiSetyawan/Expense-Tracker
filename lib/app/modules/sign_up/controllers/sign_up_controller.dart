import 'package:get/get.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController

  var isChecked = false.obs; // Menggunakan RxBool dari GetX untuk mengamati perubahan nilai.

  void toggleCheckbox(bool value) {
    isChecked.value = value;
  }
}
