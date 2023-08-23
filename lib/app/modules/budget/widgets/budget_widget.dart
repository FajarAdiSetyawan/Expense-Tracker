import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/data/budget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ItemBudget extends StatelessWidget {
  const ItemBudget({super.key, required this.budgetModel});

  final BudgetModel budgetModel;

  @override
  Widget build(BuildContext context) {
    var remaining = budgetModel.budget - budgetModel.expense;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: dark10,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 20, // Ganti sesuai diameter yang diinginkan
                      height: 20, // Ganti sesuai diameter yang diinginkan
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: getBudgetColor(), // Ganti warna sesuai yang diinginkan
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      budgetModel.category,
                      style: TextStyle(
                        color: dark100,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            budgetModel.expense > budgetModel.budget ? SvgPicture.asset('assets/icons/ic_warning.svg') : Container(),
          ],
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "${'lbl_remaining'.tr} \$${remaining < 0 ? "0" : remaining.toStringAsFixed(remaining.truncateToDouble() == remaining ? 0 : 1)}",
            style: TextStyle(
              color: dark100,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SfLinearGauge(
          axisTrackStyle: LinearAxisTrackStyle(
            thickness: 20,
            color: getBudgetColorSecondary(),
            edgeStyle: LinearEdgeStyle.bothCurve,
          ),
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          barPointers: [
            LinearBarPointer(
              animationDuration: 5000,
              animationType: LinearAnimationType.elasticOut,
              value: 70,
              thickness: 20,
              color: getBudgetColor(),
              edgeStyle: LinearEdgeStyle.bothCurve,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '\$${budgetModel.expense} of \$${budgetModel.budget}',
            style: TextStyle(
              color: dark25,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        budgetModel.expense > budgetModel.budget
            ? Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "You've exceed the limit!",
                  style: TextStyle(
                    color: red100,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            : Container()
      ],
    );
  }

  Color getBudgetColor() {
    switch (budgetModel.category) {
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
        return dark25;
      default:
        return violet20;
    }
  }

  Color getBudgetColorSecondary() {
    switch (budgetModel.category) {
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
}