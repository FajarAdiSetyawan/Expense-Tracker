import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FinancialReportController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;

  final List<Tab> myTabs = <Tab>[
    Tab(icon: SvgPicture.asset('assets/icons/ic_chart_line.svg')),
    Tab(icon: SvgPicture.asset('assets/icons/ic_chart.svg')),
  ];

  final List<Tab> nestedTab1 = <Tab>[
    Tab(
      text: 'lbl_expense'.tr,
    ),
    Tab(
      text: 'lbl_income'.tr,
    ),
  ];

  final List<Tab> nestedTab2 = <Tab>[
    Tab(
      text: 'lbl_expense'.tr,
    ),
    Tab(
      text: 'lbl_income'.tr,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  final RxString selectedValue = RxString('Monthly');
  List<String> dropDown = [
    'Weekly',
    'Monthly',
    'Yearly',
  ];

  final RxString filterValue = RxString('Transaction');
  List<String> filterOption = [
    'Transaction',
    'Food',
    'Transport',
  ];

  var selectedIndex = 0.obs;
  void changeTab(int index) {
    selectedIndex.value = index;
    tabController.animateTo(index);
  }

  var currentTabLine = 0.obs;

  void setCurrentTabLine(int index) {
    currentTabLine.value = index;
  }

  var currentTabCircular = 0.obs;

  void setCurrentTabCircular(int index) {
    currentTabCircular.value = index;
  }
}
