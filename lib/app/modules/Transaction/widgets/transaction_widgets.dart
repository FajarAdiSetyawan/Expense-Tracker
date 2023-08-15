import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/modules/transaction/controllers/transaction_controller.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:expense/app/theme/custom_button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';

class ItemFinancialReport extends StatelessWidget {
  const ItemFinancialReport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.STORY_FINANCIAL_REPORT),
        child: Container(
          decoration: BoxDecoration(
            color: violet20,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'msg_see_your_financial'.tr,
                  style: TextStyle(
                    color: violet100,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/ic_arrow_right.svg',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildTransactionList(String label, List<Transaction> transactions) {
  return Column(
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 20,
            bottom: 10,
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView.separated(
          padding: EdgeInsets.zero,
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return ItemFinancialTransaction(
              key: ValueKey(transaction.id),
              transaction: transaction,
            );
          },
        ),
      ),
    ],
  );
}

class ItemFinancialTransaction extends StatelessWidget {
  const ItemFinancialTransaction({
    super.key,
    required this.transaction,
  });
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                        '${transaction.amount > 0 ? '+' : '-'}\$${transaction.amount.abs()}',
                        style: TextStyle(
                          color: transaction.amount > 0 ? green100 : red100,
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
    );
  }

  Widget buildTransactionIcon() {
    final String iconPath = getIconPath();
    return Container(
      width: 70,
      height: 70,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: getTransactionColor(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SvgPicture.asset(iconPath),
      ),
    );
  }

  String getIconPath() {
    switch (transaction.title) {
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
    switch (transaction.title) {
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

class BottomSheetFilterTransaction extends StatelessWidget {
  const BottomSheetFilterTransaction({super.key, required this.controller});

  final TransactionController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: violet40,
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'msg_filter_transaction'.tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.resetSelections();
                  },
                  child: Container(
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
                        'lbl_reset'.tr,
                        style: TextStyle(
                          color: violet100,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextBottomSheetFilter(title: "lbl_fiter_by".tr),
          const SizedBox(height: 10),
          GroupButton(
            isRadio: true,
            enableDeselect: true,
            buttons: controller.filterByOption,
            onSelected: (value, index, isSelected) {
              if (isSelected) {
                controller.filterBy.value = index;
                controller.totalFilter.value++;
              } else {
                if (controller.totalFilter.value > 0) {
                  controller.totalFilter.value--; // Decrement the count if it's greater than zero
                }
              }
            },
            maxSelected: 1,
            options: groupButtonOption(GroupingType.row),
          ),
          const SizedBox(height: 20),
          TextBottomSheetFilter(title: "lbl_sort_by".tr),
          const SizedBox(height: 10),
          GroupButton(
            isRadio: true,
            enableDeselect: true,
            buttons: controller.sortByOption,
            onSelected: (value, index, isSelected) {
              if (isSelected) {
                controller.sortBy.value = index;
                controller.totalFilter.value++;
              } else {
                if (controller.totalFilter.value > 0) {
                  controller.totalFilter.value--; // Decrement the count if it's greater than zero
                }
              }
            },
            maxSelected: 1,
            options: groupButtonOption(GroupingType.wrap),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "lbl_category".tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Obx(
                      () => Text(
                        controller.totalFilter.value.toString() + "lbl_selected".tr,
                        style: TextStyle(color: dark25, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset(
                        'assets/icons/ic_arrow_right.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          CustomButton(
            title: 'lbl_apply'.tr,
            colorBg: violet100,
            colorText: violet20,
            colorRipple: dark50,
            width: 350,
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }

  GroupButtonOptions groupButtonOption(GroupingType groupingType) {
    return GroupButtonOptions(
      alignment: Alignment.centerLeft,
      borderRadius: BorderRadius.circular(20),
      unselectedBorderColor: light20,
      groupRunAlignment: GroupRunAlignment.start,
      groupingType: groupingType,
      selectedColor: violet40,
      selectedTextStyle: TextStyle(
        color: violet100,
        fontWeight: FontWeight.w500,
      ),
      crossGroupAlignment: CrossGroupAlignment.start,
      textAlign: TextAlign.center,
    );
  }
}

class TextBottomSheetFilter extends StatelessWidget {
  const TextBottomSheetFilter({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
