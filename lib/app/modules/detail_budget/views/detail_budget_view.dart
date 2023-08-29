import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/data/budget_model.dart';
import 'package:expense/app/theme/custom_bottom_dialog.dart';
import 'package:expense/app/theme/custom_button_style.dart';
import 'package:expense/app/theme/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../controllers/detail_budget_controller.dart';

class DetailBudgetView extends GetView<DetailBudgetController> {
  const DetailBudgetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final iconColor = Get.isDarkMode ? light100 : dark100;

    BudgetModel budgetModel = Get.arguments;
    var remaining = budgetModel.budget - budgetModel.expense;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'lbl_detail_budget'.tr,
        ),
        centerTitle: true,
        leading: GestureDetector(
          child: Transform.scale(
            scale: 0.7,
            child: SvgPicture.asset(
              'assets/icons/ic_arrows_left.svg',
              color: iconColor,
            ),
          ),
          onTap: () => Get.back(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.bottomSheet(
                BottomSheetConfirm(title: 'msg_remove_this_budget'.tr, message: 'msg_are_you_sure_do2'.tr),
              );
            },
            icon: SvgPicture.asset(
              'assets/icons/ic_trash.svg',
              color: iconColor,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Center(
            child: IntrinsicWidth(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: dark10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: getColorSecondary(budgetModel.category),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            getIconPath(budgetModel.category),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        budgetModel.category,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'lbl_remaining'.tr,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '\$${remaining < 0 ? "0" : remaining.toStringAsFixed(remaining.truncateToDouble() == remaining ? 0 : 1)}',
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SfLinearGauge(
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
          ),
          const SizedBox(height: 20),
          budgetModel.expense > budgetModel.budget
              ? IntrinsicWidth(
                  child: Container(
                    decoration: BoxDecoration(
                      color: red100,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/ic_warning.svg',
                            color: light100,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'You’ve exceed the limit',
                            style: TextStyle(
                              color: light100,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                title: 'lbl_edit'.tr,
                width: 350,
                colorBg: violet100,
                colorText: violet20,
                colorRipple: violet20,
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}
