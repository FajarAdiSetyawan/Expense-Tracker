import 'package:expense/app/core/constants/const_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transfer_controller.dart';

class TransferView extends GetView<TransferController> {
  const TransferView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: violet100,
      appBar: AppBar(
        title: Text(
          'lbl_transfer'.tr,
          style: const TextStyle(
            fontFamily: 'Intel',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          child: Image.asset(
            'assets/icons/ic_arrow_left.png',
            color: Colors.white,
            scale: 3,
          ),
          onTap: () => Get.back(),
        ),
        surfaceTintColor: violet100,
        backgroundColor: violet100,
      ),
      body: const Center(
        child: Text(
          'ExpenseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
