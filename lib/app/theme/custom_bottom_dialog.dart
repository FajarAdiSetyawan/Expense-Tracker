import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/routes/app_pages.dart';
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
