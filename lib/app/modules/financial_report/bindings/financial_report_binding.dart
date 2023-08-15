import 'package:get/get.dart';

import '../controllers/financial_report_controller.dart';

class FinancialReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinancialReportController>(
      () => FinancialReportController(),
    );
  }
}
