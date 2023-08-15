import 'package:expense/app/modules/financial_report/controllers/financial_report_controller.dart';
import 'package:get/get.dart';

class NestedTab1Controller extends GetxController with SingleGetTickerProviderMixin {
  late NestedTab1Controller tabController;
  final FinancialReportController financialReportController = Get.put(FinancialReportController()); // Initialize FinancialReportController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

class NestedTab2Controller extends GetxController with SingleGetTickerProviderMixin {
  late NestedTab2Controller tabController;
  final FinancialReportController financialReportController = Get.put(FinancialReportController()); // Initialize FinancialReportController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}