import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/data/transaction_model.dart';
import 'package:expense/app/modules/transaction/controllers/transaction_controller.dart';
import 'package:expense/app/modules/transaction/widgets/transaction_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put<TransactionController>(TransactionController());

    List<Transaction> getTransactionsForToday() {
      final now = DateTime.now();
      final todayFormatted = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

      return transactions.where((transaction) {
        final transactionDateTime = DateTime.parse(transaction.dateTime);
        final transactionDateFormatted = "${transactionDateTime.year}-${transactionDateTime.month.toString().padLeft(2, '0')}-${transactionDateTime.day.toString().padLeft(2, '0')}";

        return transactionDateFormatted == todayFormatted;
      }).toList();
    }

    List<Transaction> getTransactionsForYesterday() {
      final now = DateTime.now();
      final yesterday = now.subtract(const Duration(days: 1));
      final yesterdayFormatted = "${yesterday.year}-${yesterday.month.toString().padLeft(2, '0')}-${yesterday.day.toString().padLeft(2, '0')}";

      return transactions.where((transaction) {
        final transactionDateTime = DateTime.parse(transaction.dateTime);
        final transactionDateFormatted = "${transactionDateTime.year}-${transactionDateTime.month.toString().padLeft(2, '0')}-${transactionDateTime.day.toString().padLeft(2, '0')}";

        return transactionDateFormatted == yesterdayFormatted;
      }).toList();
    }

    List<Transaction> getTransactionsForOther() {
      final now = DateTime.now();
      final todayFormatted = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

      final yesterday = now.subtract(const Duration(days: 1));
      final yesterdayFormatted = "${yesterday.year}-${yesterday.month.toString().padLeft(2, '0')}-${yesterday.day.toString().padLeft(2, '0')}";

      return transactions.where((transaction) {
        final transactionDateTime = DateTime.parse(transaction.dateTime);
        final transactionDateFormatted = "${transactionDateTime.year}-${transactionDateTime.month.toString().padLeft(2, '0')}-${transactionDateTime.day.toString().padLeft(2, '0')}";

        return transactionDateFormatted != todayFormatted && transactionDateFormatted != yesterdayFormatted;
      }).toList();
    }

    return Scaffold(
      body: Column(
        children: [
          ItemFilterTransaction(controller: controller),
          const ItemFinancialReport(),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                buildTransactionList('lbl_today'.tr, getTransactionsForToday()),
                buildTransactionList('lbl_yesterday'.tr, getTransactionsForYesterday()),
                buildTransactionList('Other', getTransactionsForOther()),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class ItemFilterTransaction extends StatelessWidget {
  const ItemFilterTransaction({
    super.key,
    required this.controller,
  });

  final TransactionController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Container(
                constraints: const BoxConstraints(maxWidth: 140),
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                    iconSize: 0,
                    icon: Image.asset('assets/images/transparent.png', width: 0, height: 0),
                    decoration: InputDecoration(
                      prefixIcon: SvgPicture.asset(
                        fit: BoxFit.scaleDown,
                        'assets/icons/ic_arrow_down.svg',
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontFamily: 'Intel',
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: light20, width: 3.0),
                      ),
                      focusedBorder: OutlineInputBorder(
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
            IconButton.outlined(
              onPressed: () {
                Get.bottomSheet(
                  BottomSheetFilterTransaction(controller: controller),
                );
              },
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: light20,
                      width: 2,
                    ),
                  ),
                ),
              ),
              icon: Badge(
                backgroundColor: violet100,
                textStyle: TextStyle(
                  color: violet100,
                ),
                label: Obx(() => Text("${controller.totalFilter}")),
                child: SvgPicture.asset(
                  'assets/icons/ic_sort.svg',
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
