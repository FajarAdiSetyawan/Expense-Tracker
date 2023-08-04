// ignore_for_file: deprecated_member_use

import 'package:expandable_fab_lite/expandable_fab_lite.dart';
import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/modules/Transaction/views/transaction_view.dart';
import 'package:expense/app/modules/budget/views/budget_view.dart';
import 'package:expense/app/modules/home/views/home_view.dart';
import 'package:expense/app/modules/profile/views/profile_view.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  MainView({Key? key}) : super(key: key);

  final List<Widget> _pages = [
    const HomeView(),
    const TransactionView(),
    const HomeView(),
    const BudgetView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _pages[controller.bottomNavIndex],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ExpandableFab(
        icon: const Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 40,
        ),
        fabMargin: 20,
        children: [
          ActionButton(
            icon: SvgPicture.asset(
              'assets/icons/ic_income.svg',
              color: light100,
            ),
            onPressed: () => Get.toNamed(Routes.INCOME),
            color: green100,
          ),
          ActionButton(
            color: violet100,
            icon: SvgPicture.asset('assets/icons/ic_currency.svg'),
            onPressed: () => Get.toNamed(Routes.TRANSFER),
          ),
          ActionButton(
            icon: SvgPicture.asset(
              'assets/icons/ic_expenses.svg',
              color: light100,
            ),
            onPressed: () => Get.toNamed(Routes.EXPENSE),
            color: red100,
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/ic_home.svg',
                color: controller.bottomNavIndex == 0 ? violet100 : dark10,
              ),
              label: 'lbl_home'.tr,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/ic_transaction.svg',
                color: controller.bottomNavIndex == 1 ? violet100 : dark10,
              ),
              label: 'lbl_transaction'.tr,
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/ic_chart.svg',
                color: controller.bottomNavIndex == 3 ? violet100 : dark10,
              ),
              label: 'lbl_budget'.tr,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/ic_user.svg',
                color: controller.bottomNavIndex == 4 ? violet100 : dark10,
              ),
              label: 'lbl_profile'.tr,
            ),
          ],
          currentIndex: controller.bottomNavIndex,
          selectedItemColor: violet100,
          selectedLabelStyle: TextStyle(
            color: violet100,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            fontFamily: "Inter",
          ),
          unselectedFontSize: 11,
          onTap: controller.updateBottomNavIndex,
        ),
      ),
    );
  }
}
