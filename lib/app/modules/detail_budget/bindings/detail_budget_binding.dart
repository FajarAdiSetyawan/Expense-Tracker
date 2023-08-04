import 'package:get/get.dart';

import '../controllers/detail_budget_controller.dart';

class DetailBudgetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailBudgetController>(
      () => DetailBudgetController(),
    );
  }
}
