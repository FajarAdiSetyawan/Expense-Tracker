import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/data/chart_model.dart';
import 'package:expense/app/data/sales_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/financial_report_controller.dart';

class FinancialReportView extends GetView<FinancialReportController> {
  const FinancialReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Color> color = <Color>[];
    color.add(violet10);
    color.add(violet40);
    color.add(violet100);

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
                  () => Container(
                    constraints: const BoxConstraints(maxWidth: 120),
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
                        items: controller.dropDown
                            .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ),
                            )
                            .toList(),
                        value: controller.selectedValue.value,
                        onChanged: (newValue) {
                          controller.selectedValue.value = newValue ?? '';
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: [
                        Obx(
                          () => SizedBox(
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
                TabLineTab(controller: controller, gradientColors: gradientColors),
                TabCircularTab(controller: controller, gradientColors: gradientColors),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabLineTab extends StatelessWidget {
  final FinancialReportController controller;
  final LinearGradient gradientColors;

  const TabLineTab({super.key, required this.controller, required this.gradientColors});

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
                Obx(() => ListView.builder(
                      itemCount: controller.circularExpenseList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Circular Expense: ${controller.circularExpenseList[index]}'),
                        );
                      },
                    )),
                Obx(() => ListView.builder(
                      itemCount: controller.circularIncomeList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Circular Income: ${controller.circularIncomeList[index]}'),
                        );
                      },
                    )),
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

  TabCircularTab({required this.controller, required this.gradientColors});

  @override
  Widget build(BuildContext context) {
    final tabController = TabController(length: 2, vsync: Scaffold.of(context));

    tabController.addListener(() {
      int currentIndex = tabController.index;
      controller.setCurrentTabCircular(currentIndex); // Simpan indeks saat ini di dalam controller
    });

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
                            "\$ 342",
                            style: TextStyle(
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
                            "\$ 6000",
                            style: TextStyle(
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
                Obx(() => ListView.builder(
                      itemCount: controller.circularExpenseList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Circular Expense: ${controller.circularExpenseList[index]}'),
                        );
                      },
                    )),
                Obx(() => ListView.builder(
                      itemCount: controller.circularIncomeList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Circular Income: ${controller.circularIncomeList[index]}'),
                        );
                      },
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabViewContent extends StatelessWidget {
  final String tabText;

  TabViewContent({required this.tabText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(tabText),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.controller,
    required this.gradientColors,
  });

  final FinancialReportController controller;
  final LinearGradient gradientColors;

  @override
  Widget build(BuildContext context) {
    final outerTabController = TabController(length: 2, vsync: Scaffold.of(context));
    return Container(
      width: MediaQuery.of(context).size.width, // Adjust the width as needed
      child: Column(
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
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: outerTabController,
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
          // tab bar view here

          Expanded(
            child: TabBarView(
              controller: outerTabController,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width, // Adjust the width as needed
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(50, (index) {
                              return Container(
                                width: MediaQuery.of(context).size.width * 0.5, // Adjust the width of each item
                                child: Center(
                                  child: Text(
                                    'Place Bid $index', // Replace with your content
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // second tab bar view widget
                Center(
                  child: Text(
                    'Buy Now',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
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

class TabCircularChart extends StatelessWidget {
  const TabCircularChart({
    super.key,
    required this.controller,
  });

  final FinancialReportController controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 130.0),
                child: Text(
                  "\$ 7878",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SfCircularChart(
              series: <CircularSeries>[
                // Renders doughnut chart
                DoughnutSeries<CircularData, String>(
                  animationDuration: 2000,
                  animationDelay: 500,
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
          ],
        )
      ],
    );
  }
}

class TabLineChart extends StatelessWidget {
  const TabLineChart({
    super.key,
    required this.controller,
    required this.gradientColors,
  });

  final FinancialReportController controller;
  final LinearGradient gradientColors;

  @override
  Widget build(BuildContext context) {
    final outerTabController = TabController(length: 2, vsync: Scaffold.of(context));
    return DefaultTabController(
      length: 2,
      child: Column(
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
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: outerTabController,
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
          // tab bar view here

          Expanded(
            child: TabBarView(
              controller: outerTabController,
              children: const [
                // first tab bar view widget
                Column(
                  children: [
                    Center(
                      child: Text(
                        'Place Bid',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Place Bid',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Place Bid',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Place Bid',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Place Bid',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Place Bid',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Place Bid',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                // second tab bar view widget
                Center(
                  child: Text(
                    'Buy Now',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
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

class ChartSampleData {
  ChartSampleData(this.x);
  final Color x;
}
