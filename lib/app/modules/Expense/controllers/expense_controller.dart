import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ExpenseController extends GetxController {
  //TODO: Implement ExpenseController

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

  Rx<XFile?> capturedImage = Rx<XFile?>(null);

  void deleteCapturedImage() {
    if (capturedImage.value != null) {
      // Delete the captured image here
      capturedImage.value = null;
    }
  }
}
