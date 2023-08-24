import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/data/chart_model.dart';
import 'package:expense/app/data/transaction_model.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:get/get.dart';

class ItemFinancialTransaction extends StatelessWidget {
  const ItemFinancialTransaction({
    super.key,
    required this.transaction,
  });
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAIL_TRANSACTION, arguments: transaction);
      },
      child: Column(
        children: [
          Row(
            children: [
              buildTransactionIcon(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          transaction.title,
                          style: TextStyle(
                            color: dark75,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${transaction.transactionStatus == TransactionStatus.income ? '+' : '-'}\$${transaction.amount.abs()}',
                          style: TextStyle(
                            color: transaction.transactionStatus == TransactionStatus.income ? green100 : red100,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              transaction.message,
                              style: TextStyle(
                                color: dark50,
                                fontSize: 14,
                              ),
                              maxLines: 1, // Memastikan hanya satu baris
                              overflow: TextOverflow.ellipsis,
                              softWrap: false, // Tidak melakukan wrap
                            ),
                          ),
                        ),
                        Text(
                          DateFormat.jm().format(DateTime.parse(transaction.dateTime)),
                          style: TextStyle(
                            color: dark50,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildTransactionIcon() {
    final String iconPath = getIconPath(transaction.title);
    return Container(
      width: 70,
      height: 70,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: getColorSecondary(transaction.title),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SvgPicture.asset(iconPath),
      ),
    );
  }
}

class SfCartesianChartCustom extends StatelessWidget {
  const SfCartesianChartCustom({
    super.key,
    required this.chartData,
    required this.gradientColors,
    required this.width,
  });

  final List<ChartData> chartData;
  final double width;
  final LinearGradient gradientColors;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: chartData.length * width,
        height: 200,
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          primaryXAxis: CategoryAxis(isVisible: false),
          primaryYAxis: CategoryAxis(isVisible: false),
          series: <ChartSeries>[
            // Renders line chart
            SplineAreaSeries<ChartData, int>(
              dataSource: chartData,
              xValueMapper: (ChartData sales, _) => sales.x,
              yValueMapper: (ChartData sales, _) => sales.y,
              gradient: gradientColors,
              borderWidth: 5,
              borderColor: violet100,
            ),
          ],
        ),
      ),
    );
  }
}

String getIconPath(String title) {
  switch (title) {
    case 'Shopping':
      return 'assets/icons/ic_shopping_bag.svg';
    case 'Subscription':
      return 'assets/icons/ic_recurring_bill.svg';
    case 'Food':
      return 'assets/icons/ic_food.svg';
    case 'Salary':
      return 'assets/icons/ic_salary.svg';
    case 'Transportation':
      return 'assets/icons/ic_car.svg';
    case 'Passive Income':
      return 'assets/icons/ic_shopping_bag.svg';
    default:
      return '';
  }
}

Color getColor(String title) {
  switch (title) {
    case 'Shopping':
      return yellow100;
    case 'Subscription':
      return violet100;
    case 'Food':
      return red100;
    case 'Salary':
      return green100;
    case 'Transportation':
      return blue100;
    case 'Passive Income':
      return light20;
    default:
      return violet100;
  }
}

Color getColorSecondary(String title) {
  switch (title) {
    case 'Shopping':
      return yellow20;
    case 'Subscription':
      return violet20;
    case 'Food':
      return red20;
    case 'Salary':
      return green20;
    case 'Transportation':
      return blue20;
    case 'Passive Income':
      return dark10;
    default:
      return violet20;
  }
}
