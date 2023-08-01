import 'package:get/get.dart';

class SetupRetypePinController extends GetxController {
  //TODO: Implement SetupRetypePinController

  String pin = "";
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    onGetArgument();
  }

  void onGetArgument() {
    var arguments = Get.arguments;
    if (arguments is String) {
      pin = arguments;
    } else {
      // Handle the case when arguments is not a String
      // For example, show an error message or redirect to a different page.
    }
    update();
  }
}
