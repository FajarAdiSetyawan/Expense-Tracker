enum TransactionStatus {
  expense,
  income,
}

class Transaction {
  final int id;
  final String title;
  final String message;
  final double amount;
  final String dateTime;
  final TransactionStatus transactionStatus;

  Transaction({
    required this.id,
    required this.title,
    required this.message,
    required this.amount,
    required this.dateTime,
    required this.transactionStatus,
  });
}

final List<Transaction> transactions = [
  Transaction(
    id: 1,
    title: 'Shopping',
    message: 'Buy some grocery',
    amount: 30,
    transactionStatus: TransactionStatus.expense,
    dateTime: "2023-07-01 14:30:00",
  ),
  Transaction(
    id: 2,
    title: 'Shopping',
    message: 'Buy some grocery',
    amount: 120,
    transactionStatus: TransactionStatus.expense,
    dateTime: "2023-07-11 14:30:00",
  ),
  Transaction(
    id: 3,
    title: 'Subscription',
    message: 'Disney+ annual subscription',
    amount: 80,
    transactionStatus: TransactionStatus.expense,
    dateTime: "2023-07-19 14:30:00",
  ),
  Transaction(
    id: 4,
    title: 'Food',
    message: 'Buy a ramen',
    amount: 20,
    transactionStatus: TransactionStatus.expense,
    dateTime: "2023-07-21 12:30:00",
  ),
  Transaction(
    id: 5,
    title: 'Food',
    message: 'Buy a ramen',
    amount: 32,
    transactionStatus: TransactionStatus.expense,
    dateTime: "2023-08-01 14:30:00",
  ),
  Transaction(
    id: 6,
    title: 'Salary',
    message: 'Salary for July',
    amount: 5000,
    transactionStatus: TransactionStatus.income,
    dateTime: "2023-08-05 00:30:00",
  ),
  Transaction(
    id: 7,
    title: 'Transportation',
    message: 'Charging Tesla',
    amount: 18,
    transactionStatus: TransactionStatus.expense,
    dateTime: "2023-08-10 14:30:00",
  ),
  Transaction(
    id: 8,
    title: 'Food',
    message: 'Buy a ramen',
    amount: 25,
    transactionStatus: TransactionStatus.expense,
    dateTime: "2023-08-12 14:30:00",
  ),
  Transaction(
    id: 9,
    title: 'Food',
    message: 'Buy a ramen',
    amount: 39,
    transactionStatus: TransactionStatus.expense,
    dateTime: "2023-08-18 14:30:00",
  ),
  Transaction(
    id: 10,
    title: 'Salary',
    message: 'Salary for August',
    amount: 5000,
    transactionStatus: TransactionStatus.income,
    dateTime: "2023-09-01 14:30:00",
  ),
  Transaction(
    id: 11,
    title: 'Transportation',
    message: 'Charging Tesla',
    amount: 100,
    transactionStatus: TransactionStatus.expense,
    dateTime: "2023-09-09 14:30:00",
  ),
  Transaction(
    id: 12,
    title: 'Passive Income',
    message: 'UI8 Sales',
    amount: 1000,
    transactionStatus: TransactionStatus.income,
    dateTime: "2023-09-30 14:30:00",
  ),
];
