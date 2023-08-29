import 'package:expense/app/core/constants/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class ItemBalance extends StatelessWidget {
  const ItemBalance({
    super.key,
    required this.isIncome,
    required this.balance,
  });

  final bool isIncome;
  final double balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.4,
      decoration: BoxDecoration(
        color: isIncome == true ? Get.isDarkMode ? greenDark : green100 : Get.isDarkMode ? redDark : red100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: light100,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SvgPicture.asset(
                  isIncome == true ? 'assets/icons/ic_income.svg' : 'assets/icons/ic_expenses.svg',
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    isIncome == true ? 'lbl_income'.tr : 'lbl_expenses'.tr,
                    style: TextStyle(
                      color: light100,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  FittedBox(
                    child: Text(
                      '\$$balance',
                      style: TextStyle(
                        color: light100,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
