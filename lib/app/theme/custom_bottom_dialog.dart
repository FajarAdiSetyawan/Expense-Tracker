import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:expense/app/theme/custom_button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ItemBottomSheetDialog extends StatelessWidget {
  const ItemBottomSheetDialog({
    super.key,
    required this.title,
    required this.svgAsset,
    required this.onPressed,
  });

  final VoidCallback? onPressed;
  final String title;
  final String svgAsset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 3,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: violet20,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SvgPicture.asset(svgAsset),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: violet100,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showDialogSuccess(String message) {
  Get.defaultDialog(
    title: '',
    titleStyle: const TextStyle(
      fontSize: 0,
    ),
    content: Column(
      children: [
        SvgPicture.asset(
          'assets/icons/ic_success.svg',
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );

  Future.delayed(
    const Duration(seconds: 2),
    () {
      // Pindah ke rute lain
      Get.offNamed(Routes.MAIN); // Ganti dengan rute yang sesuai
    },
  );
}

class BottomSheetConfirm extends StatelessWidget {
  const BottomSheetConfirm({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: light100,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            const SizedBox(height: 40),
            Text(
              // 'msg_remove_this_transaction'.tr,
              title,
              style: TextStyle(
                color: dark100,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              // 'msg_are_you_sure_do'.tr,
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: dark25,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  title: 'lbl_no'.tr,
                  colorBg: violet20,
                  colorText: violet100,
                  colorRipple: violet80,
                  onPressed: () {},
                  width: 160,
                ),
                CustomButton(
                  title: 'lbl_yes'.tr,
                  colorBg: violet100,
                  colorText: violet20,
                  colorRipple: violet20,
                  onPressed: () {
                    showDialogSuccess('msg_transaction_has2'.tr);
                  },
                  width: 160,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
