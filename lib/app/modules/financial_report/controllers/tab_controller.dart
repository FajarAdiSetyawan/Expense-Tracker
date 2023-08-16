import 'package:expense/app/modules/financial_report/controllers/financial_report_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense/app/modules/financial_report/controllers/sub_tab_controller.dart';

class TabControllers extends GetxController with SingleGetTickerProviderMixin {
  late TabControllers tabController;
  final FinancialReportController financialReportController = Get.put(FinancialReportController()); // Initialize FinancialReportController

  late NestedTab1Controller nestedTab1Controller;
  late NestedTab2Controller nestedTab2Controller;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    nestedTab1Controller.dispose();
    nestedTab2Controller.dispose();
    super.onClose();
  }

  final List<Tab> nestedTab1 = <Tab>[
    Tab(
      text: 'lbl_expense'.tr,
    ),
    Tab(
      text: 'lbl_expense'.tr,
    ),
  ];

  final List<Tab> nestedTab2 = <Tab>[
    Tab(
      text: 'lbl_expense'.tr,
    ),
    Tab(
      text: 'lbl_expense'.tr,
    ),
  ];
}
