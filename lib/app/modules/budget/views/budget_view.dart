import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/data/budget_model.dart';
import 'package:expense/app/modules/budget/widgets/budget_widget.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:expense/app/theme/custom_button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/budget_controller.dart';

class BudgetView extends GetView<BudgetController> {
  const BudgetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => BudgetController(),
    );
    return Scaffold(
      backgroundColor: blue100,
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: SvgPicture.asset('assets/icons/ic_arrow_left.svg'),
                  iconSize: 60,
                  onPressed: () => controller.previousMonth(),
                ),
                Obx(
                  () => Text(
                    controller.months[controller.selectedMonth.value - 1],
                    style: TextStyle(
                      fontSize: 18,
                      color: light100,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/ic_arrow_right.svg',
                    color: light100,
                  ),
                  iconSize: 60,
                  onPressed: () => controller.nextMonth(),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(
                      30,
                    ),
                    topRight: Radius.circular(
                      30,
                    ),
                  ),
                  color: light100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                          shrinkWrap: true,
                          itemCount: budgetList.length,
                          itemBuilder: (context, index) => ItemBudget(
                            budgetModel: budgetList[index],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                        title: 'lbl_create_a_budget'.tr,
                        colorBg: violet100,
                        colorText: violet20,
                        colorRipple: violet20,
                        onPressed: () => Get.toNamed(Routes.CREATE_BUDGET),
                      ),
                    ),
                    const SizedBox(height: 40)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


