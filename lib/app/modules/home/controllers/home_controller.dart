import 'package:expense/app/data/chart_model.dart';
import 'package:expense/app/data/transaction_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

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

  List<Transaction> incomeTransactions = transactions.where((transaction) => transaction.transactionStatus == TransactionStatus.income).toList();
  List<Transaction> expenseTransactions = transactions.where((transaction) => transaction.transactionStatus == TransactionStatus.expense).toList();

  List<Transaction> allTransactions = transactions;

  List<ChartData> expenseChartData = chartDataList(transactions, TransactionStatus.expense);
  List<ChartData> incomeChartData = chartDataList(transactions, TransactionStatus.income);
}
