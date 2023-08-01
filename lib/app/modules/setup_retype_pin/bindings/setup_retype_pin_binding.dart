import 'package:get/get.dart';

import '../controllers/setup_retype_pin_controller.dart';

class SetupRetypePinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetupRetypePinController>(
      () => SetupRetypePinController(),
    );
  }
}
