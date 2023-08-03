import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/modules/home/widgets/item_balance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final iconList = <IconData>[
    Icons.home,
    Icons.swap_horiz,
    Icons.pie_chart_rounded,
    Icons.person,
  ];

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(2010, 130),
      ChartData(2011, 380),
      ChartData(2012, 300),
      ChartData(2013, 320),
      ChartData(2014, 250),
      ChartData(2015, 400),
    ];

    final List<SalesData> salesData = [
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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  yellow20,
                  violet20,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.transparent,
                        child: Container(
                          padding: EdgeInsets.all(4.0), // Atur ukuran padding sesuai keinginan.
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: violet100,
                              width: 2,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.network(
                              'https://picsum.photos/200',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/icons/ic_arrow_down.svg',
                            ),
                          ),
                          Text(
                            "October",
                            style: TextStyle(
                              color: dark100,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/ic_notifiaction.svg',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'lbl_account_balance'.tr,
                  style: TextStyle(
                    color: dark25,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '\$9400',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ItemBalance(isIncome: true, balance: 5000),
                    ItemBalance(isIncome: false, balance: 2500),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text(
                          'lbl_spend_frequency'.tr,
                          style: TextStyle(
                            color: dark100,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: chartData.length * 100,
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
                                dataSource: salesData,
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
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: yellow20,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 15,
                              ),
                              child: Text(
                                'lbl_today'.tr,
                                style: TextStyle(
                                  color: yellow100,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Inter",
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'lbl_week'.tr,
                            style: TextStyle(
                              color: dark25,
                              fontFamily: "Inter",
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'lbl_month'.tr,
                            style: TextStyle(
                              color: dark25,
                              fontFamily: "Inter",
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'lbl_year'.tr,
                            style: TextStyle(
                              color: dark25,
                              fontFamily: "Inter",
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'msg_recent_transaction'.tr,
                              style: TextStyle(
                                color: dark100,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Inter",
                                fontSize: 15,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: violet20,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 15,
                                ),
                                child: Text(
                                  'lbl_see_all'.tr,
                                  style: TextStyle(
                                    color: violet100,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Inter",
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 40,
                            ),
                            title: Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  margin: const EdgeInsets.only(
                                    right: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: violet20,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(
                                      'assets/icons/ic_shopping_bag.svg',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'lbl_shopping'.tr,
                                            style: TextStyle(
                                              color: dark75,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            '-\$120',
                                            style: TextStyle(
                                              color: red100,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Buy some grocery',
                                            style: TextStyle(
                                              color: dark50,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            '10:00 AM',
                                            style: TextStyle(
                                              color: dark50,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: violet20,
          size: 30,
        ),
        backgroundColor: violet100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        onPressed: () {
          _fabAnimationController.reset();
          _borderRadiusAnimationController.reset();
          _borderRadiusAnimationController.forward();
          _fabAnimationController.forward();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => AnimatedOpacity(
          opacity: controller.isBottomBarVisible.value ? 1.0 : 0.0,
          duration: Duration(milliseconds: 200),
          child: AnimatedBottomNavigationBar(
            height: controller.isBottomBarVisible.value ? 56 : 0, // Change the height to 0 to hide the bottom bar
            icons: iconList,
            activeIndex: controller.bottomNavIndex,
            gapLocation: GapLocation.center,
            blurEffect: true,
            activeColor: violet100,
            notchSmoothness: NotchSmoothness.defaultEdge,
            onTap: (index) => controller.updateBottomNavIndex(index),
            splashColor: violet60,
            splashSpeedInMilliseconds: 300,
            shadow: BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 12,
              spreadRadius: 0.5,
              color: violet80,
            ),
            //other params
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final double x;
  final double? y;
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
