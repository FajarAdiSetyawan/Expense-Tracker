import 'package:get/get.dart';

import '../controllers/detail_account_controller.dart';

class DetailAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailAccountController>(
      () => DetailAccountController(),
    );
  }
}
