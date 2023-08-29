import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/data/transaction_model.dart';
import 'package:expense/app/theme/custom_bottom_dialog.dart';
import 'package:expense/app/theme/custom_button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

import '../controllers/detail_transaction_controller.dart';

class DetailTransactionView extends GetView<DetailTransactionController> {
  const DetailTransactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Transaction transaction = Get.arguments;

    DateTime parsedDateTime = DateTime.parse(transaction.dateTime);

    String formattedDate = DateFormat('EEEE d MMMM y HH:mm').format(parsedDateTime);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'msg_detail_transaction'.tr,
          style: const TextStyle(
            fontFamily: 'Intel',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          child: Transform.scale(
            scale: 0.7,
            child: SvgPicture.asset(
              'assets/icons/ic_arrows_left.svg',
            ),
          ),
          onTap: () => Get.back(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.bottomSheet(
                BottomSheetConfirm(title: 'msg_remove_this_transaction'.tr, message: 'msg_are_you_sure_do'.tr),
              );
            },
            icon: SvgPicture.asset('assets/icons/ic_trash.svg'),
          ),
        ],
        surfaceTintColor: transaction.transactionStatus == TransactionStatus.expense
            ? Get.isDarkMode
                ? redDark
                : red100
            : transaction.transactionStatus == TransactionStatus.income
                ? Get.isDarkMode
                    ? greenDark
                    : green100
                : Get.isDarkMode
                    ? blueDark
                    : blue100,
        backgroundColor: transaction.transactionStatus == TransactionStatus.expense
            ? Get.isDarkMode
                ? redDark
                : red100
            : transaction.transactionStatus == TransactionStatus.income
                ? Get.isDarkMode
                    ? greenDark
                    : green100
                : Get.isDarkMode
                    ? blueDark
                    : blue100,
      ),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: transaction.transactionStatus == TransactionStatus.expense
                      ? Get.isDarkMode
                          ? redDark
                          : red100
                      : transaction.transactionStatus == TransactionStatus.income
                          ? Get.isDarkMode
                              ? greenDark
                              : green100
                          : Get.isDarkMode
                              ? blueDark
                              : blue100,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: Column(
                    children: [
                      Text(
                        '\$ ${transaction.amount.toStringAsFixed(
                          transaction.amount.truncateToDouble() == transaction.amount ? 0 : 1,
                        )}',
                        style: TextStyle(
                          color: light100,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        transaction.message,
                        style: TextStyle(
                          color: light100,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        formattedDate,
                        style: TextStyle(
                          color: light100,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: -60,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'lbl_type'.tr,
                                style: TextStyle(
                                  color: dark25,
                                ),
                              ),
                              Text(
                                capitalize(transaction.transactionStatus.name),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'lbl_category'.tr,
                                style: TextStyle(
                                  color: dark25,
                                ),
                              ),
                              Text(
                                capitalize(transaction.title),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'lbl_wallet'.tr,
                                style: TextStyle(
                                  color: dark25,
                                ),
                              ),
                              Text(
                                capitalize(transaction.walletStatus.name),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                border: DashedBorder.fromBorderSide(
                  dashLength: 10,
                  side: BorderSide(color: dark10, width: 1),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  Text(
                    'lbl_description'.tr,
                    style: TextStyle(
                      color: dark25,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    transaction.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'lbl_attachment'.tr,
                    style: TextStyle(
                      color: dark25,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    width: Get.width,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          transaction.imgSrc,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  CustomButton(
                    title: 'lbl_edit'.tr,
                    colorBg: violet100,
                    colorText: violet20,
                    colorRipple: violet10,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

String capitalize(String input) {
  if (input.isEmpty) {
    return input;
  }
  return input[0].toUpperCase() + input.substring(1);
}
