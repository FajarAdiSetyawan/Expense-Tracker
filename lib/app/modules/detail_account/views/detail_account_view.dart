import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/data/transaction_model.dart';
import 'package:expense/app/data/wallet_model.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:expense/app/theme/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/detail_account_controller.dart';

class DetailAccountView extends GetView<DetailAccountController> {
  const DetailAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Wallet wallet = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'lbl_account'.tr,
        ),
        centerTitle: true,
        leading: GestureDetector(
          child: Transform.scale(
            scale: 0.7,
            child: SvgPicture.asset(
              'assets/icons/ic_arrows_left.svg',
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          onTap: () => Get.back(),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.ADD_WALLET),
            icon: SvgPicture.asset(
              'assets/icons/ic_pencil.svg',
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: violet20,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      wallet.img,
                      width: 30,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  wallet.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '\$${wallet.balance.floor().toString()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'lbl_today'.tr,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                shrinkWrap: true,
                itemCount: transactions.length,
                itemBuilder: (context, index) => ItemFinancialTransaction(
                  transaction: transactions[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
