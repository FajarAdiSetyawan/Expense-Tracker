import 'package:camera/camera.dart';
import 'package:get/get.dart';

class IncomeController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }

  Rx<XFile?> capturedImage = Rx<XFile?>(null);

  void deleteCapturedImage() {
    if (capturedImage.value != null) {
      // Delete the captured image here
      capturedImage.value = null;
    }
  }
}
