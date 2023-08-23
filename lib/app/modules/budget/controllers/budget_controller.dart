import 'package:get/get.dart';

class BudgetController extends GetxController {
  //TODO: Implement BudgetController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var selectedMonth = DateTime.now().month.obs;

  final List<String> months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

  void previousMonth() {
    selectedMonth.value = (selectedMonth.value - 1) % 12;
    if (selectedMonth.value == 0) {
      selectedMonth.value = 12;
    }
    print('previousMonth');
  }

  void nextMonth() {
    selectedMonth.value = (selectedMonth.value % 12) + 1;
     print('nextMonth');
  }
}
