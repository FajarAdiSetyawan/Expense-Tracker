import 'package:expense/app/modules/financial_report/controllers/financial_report_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabControllers extends GetxController with SingleGetTickerProviderMixin {
  late TabControllers tabController;
  final FinancialReportController financialReportController = Get.put(FinancialReportController()); // Initialize 

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
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
