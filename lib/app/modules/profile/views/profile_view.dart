import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:expense/app/theme/custom_bottom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final colorTheme = Get.isDarkMode ? light100 : dark100;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.transparent,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: violet100,
                        width: 2,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        'https://picsum.photos/200',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'lbl_username'.tr,
                      style: TextStyle(
                        color: dark25,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Fajar Adi Setyawan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/ic_pencil.svg',
                        color: colorTheme,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.ACCOUNT),
                      child: ItemMenuAccount(
                        bgColor: violet20,
                        svgAsset: 'assets/icons/ic_wallet.svg',
                        title: 'lbl_account'.tr,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.SETTING),
                      child: ItemMenuAccount(
                        bgColor: violet20,
                        svgAsset: 'assets/icons/ic_settings.svg',
                        title: 'lbl_settings'.tr,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.EXPORT),
                      child: ItemMenuAccount(
                        bgColor: violet20,
                        svgAsset: 'assets/icons/ic_upload.svg',
                        title: 'lbl_export_data'.tr,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => Get.bottomSheet(
                        BottomSheetConfirm(
                          title: 'lbl_logout2'.tr,
                          message: 'msg_are_you_sure_do3'.tr,
                        ),
                      ),
                      child: ItemMenuAccount(
                        bgColor: red20,
                        svgAsset: 'assets/icons/ic_logout.svg',
                        title: 'lbl_logout'.tr,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemMenuAccount extends StatelessWidget {
  const ItemMenuAccount({
    super.key,
    required this.bgColor,
    required this.svgAsset,
    required this.title,
  });

  final Color bgColor;
  final String svgAsset;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: SvgPicture.asset(svgAsset),
          ),
        ),
        const SizedBox(width: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
