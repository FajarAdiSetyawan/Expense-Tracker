import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/modules/financial_report/views/financial_report_view.dart';
import 'package:expense/app/theme/custom_button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class StoryItem4 extends StatelessWidget {
  const StoryItem4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: violet100,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 100, right: 20, left: 20),
        child: Column(
          children: [
            Text(
              "lbl_this_month".tr,
              style: TextStyle(
                color: light100.withAlpha(900),
                fontFamily: "Inter",
                fontSize: 20,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 200),
            Text(
              'msg_financial_freedom'.tr,
              style: TextStyle(
                color: light100.withAlpha(1000),
                fontFamily: "Inter",
                fontSize: 30,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'msg_robert_kiyosaki'.tr,
                style: TextStyle(
                  color: light100.withAlpha(970),
                  fontFamily: "Inter",
                  fontSize: 25,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 50,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    title: 'msg_see_the_full_detail'.tr,
                    colorBg: light100,
                    colorText: violet100,
                    colorRipple: violet20,
                    onPressed: () {
                      Get.to(() => const FinancialReportView());
                    },
                    width: 350,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StoryItem3 extends StatelessWidget {
  const StoryItem3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: violet100,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 100, right: 20, left: 20),
        child: Column(
          children: [
            Text(
              "lbl_this_month".tr,
              style: TextStyle(
                color: light100.withAlpha(900),
                fontFamily: "Inter",
                fontSize: 20,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 200),
            Text(
              'msg_2_of_12_budget_is'.tr,
              style: TextStyle(
                color: light100.withAlpha(990),
                fontFamily: "Inter",
                fontSize: 20,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: yellow20,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset('assets/icons/ic_shopping_bag.svg'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'lbl_shopping'.tr,
                          style: TextStyle(
                            color: dark75,
                            fontFamily: "Inter",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: red20,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset('assets/icons/ic_food.svg'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'lbl_food'.tr,
                          style: TextStyle(
                            color: dark75,
                            fontFamily: "Inter",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemStoryExpenseIncome extends StatelessWidget {
  const ItemStoryExpenseIncome({
    super.key,
    required this.title,
    required this.titleTransaction,
    required this.transaction,
    required this.svgAssets,
    required this.balance1,
    required this.balance2,
    required this.bgColor,
  });

  final String title;
  final String titleTransaction;
  final String transaction;
  final String svgAssets;
  final int balance1;
  final int balance2;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: bgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 100, right: 20, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "lbl_this_month".tr,
              style: TextStyle(
                color: light100.withAlpha(900),
                fontFamily: "Inter",
                fontSize: 20,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            Text(
              title,
              style: TextStyle(
                color: light80,
                fontFamily: "Inter",
                fontSize: 30,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "\$ $balance1",
              style: TextStyle(
                color: light80,
                fontFamily: "Inter",
                fontSize: 50,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          titleTransaction,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: dark75,
                            fontFamily: "Inter",
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        IntrinsicWidth(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: dark10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: getTransactionColor(),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(getIconPath()),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    transaction,
                                    style: TextStyle(
                                      color: dark75,
                                      fontFamily: "Inter",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "\$ $balance2",
                          style: TextStyle(
                            color: dark75,
                            fontFamily: "Inter",
                            fontSize: 30,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  String getIconPath() {
    switch (transaction.tr) {
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
      default:
        return '';
    }
  }

  Color getTransactionColor() {
    switch (transaction.tr) {
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
      default:
        return violet20;
    }
  }
}
