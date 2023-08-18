import 'package:get/get.dart';

class TransactionController extends GetxController {
  //TODO: Implement TransactionController

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

  RxInt totalFilter = 0.obs;
  RxInt sortBy = 0.obs;
  RxInt filterBy = 0.obs;

  void resetSelections() {
    print("Before reset - sortBy: ${sortBy.value}, filterBy: ${filterBy.value}");
    sortBy.value = 0;
    filterBy.value = 0;
    print("After reset - sortBy: ${sortBy.value}, filterBy: ${filterBy.value}");
  }

  List<String> sortByOption = ['Highest', 'Lowest', 'Newest', 'Oldest'];
  List<String> filterByOption = ['Income', 'Expense', 'Transfer'];

  final RxString selectedValue = RxString('Monthly');

  List<String> dropDown = [
    'Weekly',
    'Monthly',
    'Yearly',
  ];
}


