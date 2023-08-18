import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/data/chart_model.dart';
import 'package:expense/app/data/sales_model.dart';
import 'package:expense/app/data/transaction_model.dart';
import 'package:expense/app/modules/transaction/widgets/transaction_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../controllers/financial_report_controller.dart';

class FillterDropDown extends StatelessWidget {
  FillterDropDown({super.key, required this.controller, required this.option, this.selected = '', this.width = 120});

  final FinancialReportController controller;
  final List<String> option;
  String selected;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: width),
      padding: EdgeInsets.zero,
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField(
          padding: EdgeInsets.zero,
          iconSize: 0,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          icon: Image.asset('assets/images/transparent.png', width: 0, height: 0),
          decoration: InputDecoration(
            labelStyle: const TextStyle(
              fontSize: 14,
            ),
            prefixIcon: SvgPicture.asset(
              fit: BoxFit.scaleDown,
              'assets/icons/ic_arrow_down.svg',
            ),
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontFamily: 'Intel',
              fontSize: 14,
            ),
            enabledBorder: OutlineInputBorder(
              gapPadding: 0,
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: light20, width: 3.0),
            ),
            focusedBorder: OutlineInputBorder(
              gapPadding: 0,
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: light20, width: 3.0),
            ),
          ),
          items: option
              .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ),
              )
              .toList(),
          value: selected,
          onChanged: (newValue) {
            selected = newValue ?? '';
          },
        ),
      ),
    );
  }
}

class TabLineTab extends StatelessWidget {
  final FinancialReportController controller;
  final LinearGradient gradientColors;
  final List<Transaction> incomeTransactions;
  final List<Transaction> expenseTransactions;

  const TabLineTab({
    super.key,
    required this.controller,
    required this.gradientColors,
    required this.expenseTransactions,
    required this.incomeTransactions,
  });

  @override
  Widget build(BuildContext context) {
    final tabController = TabController(length: 2, vsync: Scaffold.of(context));

    tabController.addListener(() {
      int currentIndex = tabController.index;
      controller.setCurrentTabLine(currentIndex); // Simpan indeks saat ini di dalam controller
    });

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Obx(
            () {
              return controller.currentTabLine.value == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Text(
                            "\$ 2121",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SingleChildScrollView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: controller.chartData.length * 80,
                            height: 200,
                            child: SfCartesianChart(
                              primaryXAxis: DateTimeAxis(
                                isVisible: false,
                              ),
                              primaryYAxis: NumericAxis(
                                isVisible: false,
                              ),
                              indicators: [
                                AtrIndicator(
                                  animationDuration: 1,
                                ),
                              ],
                              series: <CartesianSeries>[
                                // Renders line chart
                                SplineAreaSeries<SalesData, DateTime>(
                                  dataSource: controller.salesData,
                                  xValueMapper: (SalesData sales, _) => sales.year,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                  gradient: gradientColors,
                                  borderWidth: 5,
                                  borderColor: violet100,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Text(
                            "\$ 7878",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SingleChildScrollView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: controller.chartData2.length * 80,
                            height: 200,
                            child: SfCartesianChart(
                              primaryXAxis: DateTimeAxis(
                                isVisible: false,
                              ),
                              primaryYAxis: NumericAxis(
                                isVisible: false,
                              ),
                              indicators: [
                                AtrIndicator(
                                  animationDuration: 1,
                                ),
                              ],
                              series: <CartesianSeries>[
                                // Renders line chart
                                SplineAreaSeries<SalesData, DateTime>(
                                  dataSource: controller.salesData2,
                                  xValueMapper: (SalesData sales, _) => sales.year,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                  gradient: gradientColors,
                                  borderWidth: 5,
                                  borderColor: violet100,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: violet20,
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBar(
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: violet100,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: controller.nestedTab1,
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => FillterDropDown(
                              controller: controller,
                              option: controller.filterOption,
                              selected: controller.filterValue.value,
                              width: 150,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/icons/ic_sort_filter.svg'),
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: violet20, width: 2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(), // kaga bisa discroll
                        itemCount: expenseTransactions.length,
                        itemBuilder: (context, index) => ItemFinancialTransaction(
                          transaction: expenseTransactions[index],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => FillterDropDown(
                              controller: controller,
                              option: controller.filterOption,
                              selected: controller.filterValue.value,
                              width: 150,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/icons/ic_sort_filter.svg'),
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: violet20, width: 2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(), // kaga bisa discroll
                        itemCount: incomeTransactions.length,
                        itemBuilder: (context, index) => ItemFinancialTransaction(
                          transaction: incomeTransactions[index],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class TabCircularTab extends StatelessWidget {
  final FinancialReportController controller;
  final LinearGradient gradientColors;
  final List<Transaction> incomeTransactions;
  final List<Transaction> expenseTransactions;

  const TabCircularTab({
    super.key,
    required this.controller,
    required this.gradientColors,
    required this.expenseTransactions,
    required this.incomeTransactions,
  });

  @override
  Widget build(BuildContext context) {
    final tabController = TabController(length: 2, vsync: Scaffold.of(context));

    tabController.addListener(() {
      int currentIndex = tabController.index;
      controller.setCurrentTabCircular(currentIndex); // Simpan indeks saat ini di dalam controller
    });

    double totalExpenseAmount = expenseTransactions.fold(0, (previousValue, transaction) => previousValue + (-transaction.amount));

    double totalIncomeAmount = incomeTransactions.fold(0, (previousValue, transaction) => previousValue + transaction.amount);

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Obx(
            () => controller.currentTabCircular.value == 0
                ? SfCircularChart(
                    annotations: [
                      CircularChartAnnotation(
                        widget: Center(
                          child: Text(
                            "\$ $totalExpenseAmount",
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      )
                    ],
                    series: <CircularSeries>[
                      // Renders doughnut chart
                      DoughnutSeries<CircularData, String>(
                        animationDuration: 2000,
                        dataSource: controller.expenseData,
                        // pointColorMapper: (CircularData data, _) => data.color,
                        xValueMapper: (CircularData data, _) => data.x,
                        yValueMapper: (CircularData data, _) => data.y,
                        pointColorMapper: (CircularData data, _) => data.color,
                        innerRadius: "80",
                        explode: true,
                        explodeGesture: ActivationMode.doubleTap,
                      )
                    ],
                  )
                : SfCircularChart(
                    annotations: [
                      CircularChartAnnotation(
                        widget: Center(
                          child: Text(
                            "\$ $totalIncomeAmount",
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      )
                    ],
                    series: <CircularSeries>[
                      // Renders doughnut chart
                      DoughnutSeries<CircularData, String>(
                        animationDuration: 2000,
                        animationDelay: 500,
                        dataSource: controller.incomeData,
                        // pointColorMapper: (CircularData data, _) => data.color,
                        xValueMapper: (CircularData data, _) => data.x,
                        yValueMapper: (CircularData data, _) => data.y,
                        pointColorMapper: (CircularData data, _) => data.color,
                        innerRadius: "80",
                        explode: true,
                        sortingOrder: SortingOrder.ascending,
                        explodeGesture: ActivationMode.doubleTap,
                      )
                    ],
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: violet20,
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBar(
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: violet100,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: controller.nestedTab2,
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => FillterDropDown(
                              controller: controller,
                              option: controller.filterOption,
                              selected: controller.filterValue.value,
                              width: 150,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/icons/ic_sort_filter.svg'),
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: violet20, width: 2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(), // kaga bisa discroll
                        itemCount: expenseTransactions.length,
                        itemBuilder: (context, index) => ItemProgressFinancial(
                          transaction: expenseTransactions[index],
                          maxValue: totalExpenseAmount,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => FillterDropDown(
                              controller: controller,
                              option: controller.filterOption,
                              selected: controller.filterValue.value,
                              width: 150,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/icons/ic_sort_filter.svg'),
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: violet20, width: 2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(), // kaga bisa discroll
                        itemCount: incomeTransactions.length,
                        itemBuilder: (context, index) => ItemProgressFinancial(
                          transaction: incomeTransactions[index],
                          maxValue: totalIncomeAmount,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemProgressFinancial extends StatelessWidget {
  final Transaction transaction;
  final double maxValue;

  const ItemProgressFinancial({super.key, required this.transaction, required this.maxValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  width: 2,
                  color: light20,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      width: 20, // Ganti sesuai diameter yang diinginkan
                      height: 20, // Ganti sesuai diameter yang diinginkan
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: getTransactionColor(), // Ganti warna sesuai yang diinginkan
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      transaction.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              '${transaction.amount > 0 ? '+' : '-'}\$${transaction.amount.abs()}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: transaction.amount > 0 ? green100 : red100,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SfLinearGauge(
          axisTrackStyle: LinearAxisTrackStyle(
            thickness: 20,
            color: getTrackColor(),
            edgeStyle: LinearEdgeStyle.bothCurve,
          ),
          minimum: 0,
          maximum: maxValue,
          showLabels: false,
          showTicks: false,
          barPointers: [
            LinearBarPointer(
              animationDuration: 5000,
              animationType: LinearAnimationType.elasticOut,
              value: transaction.amount.abs(),
              thickness: 20,
              color: getTransactionColor(),
              edgeStyle: LinearEdgeStyle.bothCurve,
            ),
          ],
        ),
      ],
    );
  }

  Color getTransactionColor() {
    switch (transaction.title) {
      case 'Shopping':
        return yellow100;
      case 'Subscription':
        return violet100;
      case 'Food':
        return red100;
      case 'Salary':
        return green100;
      case 'Transportation':
        return violet100;
      case 'Passive Income':
        return dark50;
      default:
        return violet20;
    }
  }

  Color getTrackColor() {
    switch (transaction.title) {
      case 'Shopping':
        return yellow20;
      case 'Subscription':
        return violet20;
      case 'Food':
        return red20;
      case 'Salary':
        return green20;
      case 'Transportation':
        return violet20;
      case 'Passive Income':
        return light20;
      default:
        return violet20;
    }
  }
}
