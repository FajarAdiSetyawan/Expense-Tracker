import 'package:expense/app/data/transaction_model.dart';

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double? y;
}

List<ChartData> chartDataList(List<Transaction> transactions, TransactionStatus status) {
  List<ChartData> chartDataList = [];

  for (var transaction in transactions) {
    if (transaction.transactionStatus == status) {
      chartDataList.add(ChartData(transaction.id, transaction.amount));
    }
  }

  return chartDataList;
}
