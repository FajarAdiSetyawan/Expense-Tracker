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
                ListView(
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
                    TabBar(tabs: controller.nestedTab1, controller: controller.nestedTab1Controller,)
                  ],
                ),
                ListView(
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
                              dataSource: controller.circularData,
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChartSampleData {
  ChartSampleData(this.x);
  final Color x;
}
