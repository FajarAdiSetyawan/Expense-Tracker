import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/data/transaction_model.dart';
import 'package:expense/app/modules/home/widgets/item_balance.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:expense/app/theme/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<HomeController>(HomeController());

    double totalIncomeAmount = 0;
    double totalExpenseAmount = 0;

    for (var transaction in controller.incomeTransactions) {
      totalIncomeAmount += transaction.amount;
    }

    for (var transaction in controller.expenseTransactions) {
      totalExpenseAmount += transaction.amount;
    }

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
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.PROFILE),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.transparent,
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
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
                        onPressed: () => Get.toNamed(Routes.NOTIFICATION),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ItemBalance(isIncome: true, balance: totalIncomeAmount),
                    ItemBalance(isIncome: false, balance: totalExpenseAmount),
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
                      SfCartesianChartCustom(
                        chartData: controller.expenseChartData,
                        gradientColors: gradientColors,
                        width: 50,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(), // kaga bisa discroll
                          itemCount: transactions.length,
                          itemBuilder: (context, index) => ItemFinancialTransaction(
                            transaction: transactions[index],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
