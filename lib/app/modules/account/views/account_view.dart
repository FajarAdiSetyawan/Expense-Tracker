import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/data/wallet_model.dart';
import 'package:expense/app/modules/account/widget/account_widget.dart';
import 'package:expense/app/theme/custom_button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light100,
      appBar: AppBar(
        title: Text(
          'lbl_account'.tr,
          style: const TextStyle(
            fontFamily: 'Intel',
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          child: Transform.scale(
            scale: 0.7,
            child: SvgPicture.asset(
              'assets/icons/ic_arrows_left.svg',
              color: dark100,
            ),
          ),
          onTap: () => Get.back(),
        ),
        surfaceTintColor: light100,
        backgroundColor: light100,
      ),
      body: Column(
        children: [
          IntrinsicHeight(
            child: Container(
              width: Get.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/img_bg_account.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 70),
                child: Column(
                  children: [
                    Text(
                      'lbl_account_balance'.tr,
                      style: TextStyle(
                        color: dark25,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '\$9000',
                      style: TextStyle(
                        color: dark100,
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            shrinkWrap: true,
            itemCount: walletList.length,
            itemBuilder: (context, index) => ItemWalletBalance(
              wallet: walletList[index],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                title: 'msg_add_new_wallet'.tr,
                colorBg: violet100,
                colorRipple: violet20,
                colorText: violet20,
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


