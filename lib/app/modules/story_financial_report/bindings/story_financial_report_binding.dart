import 'package:get/get.dart';

import '../controllers/story_financial_report_controller.dart';

class StoryFinancialReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoryFinancialReportController>(
      () => StoryFinancialReportController(),
    );
  }
}
