import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/data/chart_model.dart';
import 'package:expense/app/data/sales_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FinancialReportController extends GetxController with GetTickerProviderStateMixin {
  //TODO: Implement FinancialReportController

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

  List<ChartData> chartData = [
    ChartData(2010, 130),
    ChartData(2011, 380),
    ChartData(2012, 300),
    ChartData(2013, 320),
    ChartData(2014, 250),
    ChartData(2015, 400),
  ];

  List<SalesData> salesData = [
    SalesData(DateTime(2010), 130),
    SalesData(DateTime(2011), 240),
    SalesData(DateTime(2012), 245),
    SalesData(DateTime(2013), 100),
    SalesData(DateTime(2014), 350),
    SalesData(DateTime(2015), 200),
    SalesData(DateTime(2016), 250),
    SalesData(DateTime(2017), 600),
    SalesData(DateTime(2018), 250),
    SalesData(DateTime(2019), 100),
    SalesData(DateTime(2020), 250),
    SalesData(DateTime(2021), 320),
    SalesData(DateTime(2022), 210),
    SalesData(DateTime(2023), 200),
  ];

  List<ChartData> chartData2 = [
    ChartData(2010, 130),
    ChartData(2011, 280),
    ChartData(2012, 300),
    ChartData(2013, 120),
    ChartData(2014, 150),
    ChartData(2015, 400),
  ];

  List<SalesData> salesData2 = [
    SalesData(DateTime(2010), 200),
    SalesData(DateTime(2011), 240),
    SalesData(DateTime(2012), 245),
    SalesData(DateTime(2013), 600),
    SalesData(DateTime(2014), 100),
    SalesData(DateTime(2015), 200),
    SalesData(DateTime(2016), 250),
    SalesData(DateTime(2017), 600),
    SalesData(DateTime(2018), 250),
    SalesData(DateTime(2019), 320),
    SalesData(DateTime(2020), 250),
    SalesData(DateTime(2021), 20),
    SalesData(DateTime(2022), 210),
    SalesData(DateTime(2023), 200),
  ];

  List<CircularData> expenseData = [
    CircularData('David', 25, violet100),
    CircularData('Steve', 38, yellow100),
    CircularData('Jack', 34, red100),
    CircularData('Others', 52, green100),
  ];

  List<CircularData> incomeData = [
    CircularData('Steve', 30, dark75),
    CircularData('Steve', 70, green100),
  ];

  var currentTabLine = 0.obs;

  void setCurrentTabLine(int index) {
    currentTabLine.value = index;
  }

  var currentTabCircular = 0.obs;

  void setCurrentTabCircular(int index) {
    currentTabCircular.value = index;
  }


}
