import 'package:get/get.dart';

import '../controllers/sign_up_success_controller.dart';

class SignUpSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpSuccessController>(
      () => SignUpSuccessController(),
    );
  }
}
