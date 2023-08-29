import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'lbl_settings'.tr,
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
        elevation: 0.5,
        shadowColor: dark10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ItemsSettings(
              title: 'lbl_currency'.tr,
              selected: 'USD',
            ),
            const SizedBox(height: 25),
            ItemsSettings(
              title: 'lbl_language'.tr,
              selected: 'English',
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: () async {
                await Get.toNamed(Routes.SETTING_THEME);
                controller.loadSavedTheme(); // Panggil method untuk memperbarui tema
              },
              child: Obx(
                () => ItemsSettings(
                  title: 'lbl_theme'.tr,
                  selected: controller.selectedTheme.value == 1 ? 'Light' : (controller.selectedTheme.value == 2 ? 'Dark' : 'Use device theme'),
                ),
              ),
            ),
            const SizedBox(height: 25),
            ItemsSettings(
              title: 'lbl_security'.tr,
              selected: 'Fingerprint',
            ),
            const SizedBox(height: 25),
            ItemsSettings(
              title: 'lbl_notification'.tr,
              selected: '',
            ),
            const SizedBox(height: 60),
            ItemsSettings(
              title: 'lbl_about'.tr,
              selected: '',
            ),
            const SizedBox(height: 25),
            ItemsSettings(
              title: 'lbl_help'.tr,
              selected: '',
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

class ItemsSettings extends StatelessWidget {
  const ItemsSettings({
    super.key,
    required this.title,
    required this.selected,
  });

  final String title;
  final String selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              selected,
              style: TextStyle(
                color: dark25,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        SvgPicture.asset(
          'assets/icons/ic_arrow_right.svg',
        ),
      ],
    );
  }
}
