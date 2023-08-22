import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/data/transaction_model.dart';
import 'package:expense/app/modules/financial_report/widgets/financial_report_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/financial_report_controller.dart';

class FinancialReportView extends GetView<FinancialReportController> {
  const FinancialReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Color> color = <Color>[];
    color.add(Colors.white);
    color.add(violet40);
    color.add(violet60);

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors = LinearGradient(
      colors: color,
      stops: stops,
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );

    List<Transaction> incomeTransactions = transactions.where((transaction) => transaction.transactionStatus == TransactionStatus.income).toList();
    List<Transaction> expenseTransactions = transactions.where((transaction) => transaction.transactionStatus == TransactionStatus.expense).toList();

    return Scaffold(
      backgroundColor: light100,
      appBar: AppBar(
        title: Text(
          'msg_financial_report'.tr,
          style: const TextStyle(
            fontFamily: 'Intel',
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          child: Image.asset(
            'assets/icons/ic_arrow_left.png',
            color: Colors.black,
            scale: 3,
          ),
          onTap: () => Get.back(),
        ),
        surfaceTintColor: light100,
        backgroundColor: light100,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => FillterDropDown(
                    controller: controller,
                    option: controller.dropDown,
                    selected: controller.selectedValue.value,
                    width: 120,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: [
                        Obx(
                          () => Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: violet20, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 100,
                            height: 50,
                            child: TabBar(
                              dividerColor: Colors.transparent,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                color: violet100,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(controller.selectedIndex == 0 ? 8.0 : 0.0),
                                  bottomLeft: Radius.circular(controller.selectedIndex == 0 ? 8.0 : 0.0),
                                  topRight: Radius.circular(controller.selectedIndex == 1 ? 8.0 : 0.0),
                                  bottomRight: Radius.circular(controller.selectedIndex == 1 ? 8.0 : 0.0),
                                ),
                              ),
                              controller: controller.tabController,
                              labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                              onTap: controller.changeTab,
                              tabs: controller.myTabs.map(
                                (tab) {
                                  return ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      controller.selectedIndex == controller.myTabs.indexOf(tab)
                                          ? Colors.white // Set white color when tab is selected
                                          : Colors.grey, // No color filter when tab is not selected
                                      BlendMode.srcIn,
                                    ),
                                    child: tab.icon!,
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                TabLineTab(
                  controller: controller,
                  gradientColors: gradientColors,
                  expenseTransactions: expenseTransactions,
                  incomeTransactions: incomeTransactions,
                ),
                TabCircularTab(
                  controller: controller,
                  gradientColors: gradientColors,
                  expenseTransactions: expenseTransactions,
                  incomeTransactions: incomeTransactions,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
