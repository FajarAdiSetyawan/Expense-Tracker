import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/modules/story_financial_report/widgets/story_financial_report_widgets.dart';
import 'package:expense/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

import '../controllers/story_financial_report_controller.dart';

class StoryFinancialReportView extends StatefulWidget {
  const StoryFinancialReportView({super.key});

  @override
  _StoryFinancialReportView createState() => _StoryFinancialReportView();
}

class _StoryFinancialReportView extends State<StoryFinancialReportView> {
  @override
  Widget build(BuildContext context) {
    final storyController = StoryController();
    return StoryView(
      storyItems: [
        StoryItem(
          ItemStoryExpenseIncome(
            title: 'lbl_you_spend'.tr,
            titleTransaction: 'msg_and_your_biggest'.tr,
            transaction: 'lbl_shopping'.tr,
            svgAssets: 'assets/icons/ic_salary.svg',
            balance1: 332,
            balance2: 120,
            bgColor: red100,
          ),
          duration: const Duration(
            seconds: 5,
          ),
        ),
        StoryItem(
          ItemStoryExpenseIncome(
            title: 'lbl_you_earned'.tr,
            titleTransaction: 'msg_your_biggest_income'.tr,
            transaction: 'lbl_salary'.tr,
            svgAssets: 'assets/icons/ic_salary.svg',
            balance1: 6000,
            balance2: 5000,
            bgColor: green100,
          ),
          duration: const Duration(
            seconds: 5,
          ),
        ),
        StoryItem(
          const StoryItem3(),
          duration: const Duration(
            seconds: 5,
          ),
        ),
        StoryItem(
          const StoryItem4(),
          duration: const Duration(
            seconds: 5,
          ),
        ),
      ],
      onStoryShow: (s) {
        print("Showing a story");
      },
      onComplete: () {
        Get.toNamed(Routes.FINANCIAL_REPORT);
      },
      progressPosition: ProgressPosition.top,
      repeat: false,
      controller: storyController,
    );
  }
}
