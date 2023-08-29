import 'package:expense/app/core/constants/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/setting_theme_controller.dart';

class SettingThemeView extends GetView<SettingThemeController> {
  const SettingThemeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lbl_theme'.tr),
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
      body: Column(
        children: [
          Obx(
            () => MyRadioListTile<int>(
              value: 1,
              groupValue: controller.selectedValue.value,
              leading: 'Light',
              title: const Text('Light'),
              onChanged: (value) {
                Future.delayed(Duration.zero, () {
                  controller.updateSelectedValue(value!);
                  controller.applySelectedTheme(value);
                });
              },
            ),
          ),
          Obx(
            () => MyRadioListTile<int>(
              value: 2,
              groupValue: controller.selectedValue.value,
              leading: 'Dark',
              title: const Text('Dark'),
              onChanged: (value) {
                Future.delayed(Duration.zero, () {
                  controller.updateSelectedValue(value!);
                  controller.applySelectedTheme(value);
                });
              },
            ),
          ),
          Obx(
            () => MyRadioListTile<int>(
              value: 3,
              groupValue: controller.selectedValue.value,
              leading: 'Use device theme',
              title: const Text('Use device theme'),
              onChanged: (value) {
                Future.delayed(Duration.zero, () {
                  controller.updateSelectedValue(value!);
                  controller.applySelectedTheme(value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBar appBar;
  final double elevation;

  const AppBarCustom({
    super.key,
    required this.title,
    required this.appBar,
    required this.elevation,
  });

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Get.isDarkMode ? dark100 : light100,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Intel',
          color: Get.isDarkMode ? light100 : dark100,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      leading: GestureDetector(
        child: Transform.scale(
          scale: 0.7,
          child: SvgPicture.asset(
            'assets/icons/ic_arrows_left.svg',
            color: Get.isDarkMode ? light100 : dark100,
          ),
        ),
        onTap: () => Get.back(),
      ),
      elevation: elevation,
      shadowColor: dark10,
      surfaceTintColor: Get.isDarkMode ? dark100 : light100,
    );
  }
}

class MyRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String leading;
  final Widget? title;
  final ValueChanged<T?> onChanged;

  const MyRadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (title != null)
              Text(
                leading,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            _customRadioButton,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
      child: isSelected
          ? SvgPicture.asset(
              'assets/icons/ic_success.svg',
              width: 35,
              height: 35,
            )
          : Container(),
    );
  }
}
