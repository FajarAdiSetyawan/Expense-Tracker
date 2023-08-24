import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/data/budget_model.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:expense/app/theme/custom_widgets.dart';
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
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAIL_BUDGET, arguments: budgetModel),
      child: Column(
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
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: getColor(budgetModel.category),
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
              color: getColorSecondary(budgetModel.category),
              edgeStyle: LinearEdgeStyle.bothCurve,
            ),
            minimum: 0,
            maximum: budgetModel.budget,
            showLabels: false,
            showTicks: false,
            barPointers: [
              LinearBarPointer(
                animationDuration: 5000,
                animationType: LinearAnimationType.elasticOut,
                value: budgetModel.expense,
                thickness: 20,
                color: getColor(budgetModel.category),
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
      ),
    );
  }


}
