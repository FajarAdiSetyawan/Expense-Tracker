class Transaction {
  final int id;
  final String title;
  final String message;
  final double amount;
  final String dateTime;

  Transaction({
    required this.id,
    required this.title,
    required this.message,
    required this.amount,
    required this.dateTime,
  });
}

final List<Transaction> transactions = [
  Transaction(id: 1, title: 'Shopping', message: 'Buy some grocery', amount: -120, dateTime: "2023-08-11 14:30:00"),
  Transaction(id: 2, title: 'Subscription', message: 'Disney+ annual subscription', amount: -80, dateTime: "2023-08-11 14:30:00"),
  Transaction(id: 3, title: 'Food', message: 'Buy a ramen', amount: -32, dateTime: "2023-08-11 14:30:00"),
  Transaction(id: 4, title: 'Food', message: 'Buy a ramen', amount: -32, dateTime: "2023-08-10 14:30:00"),
  Transaction(id: 5, title: 'Salary', message: 'Salary for July', amount: 5000, dateTime: "2023-08-10 14:30:00"),
  Transaction(
    id: 6,
    title: 'Transportation',
    message: 'Charging Tesla',
    amount: -18,
    dateTime: "2023-08-10 14:30:00",
  ),
  Transaction(id: 7, title: 'Food', message: 'Buy a ramen', amount: -32, dateTime: "2023-08-08 14:30:00"),
  Transaction(id: 8, title: 'Food', message: 'Buy a ramen', amount: -32, dateTime: "2023-08-08 14:30:00"),
  Transaction(id: 9, title: 'Salary', message: 'Salary for July', amount: 5000, dateTime: "2023-08-07 14:30:00"),
  Transaction(
    id: 10,
    title: 'Transportation',
    message: 'Charging Tesla',
    amount: -18,
    dateTime: "2023-08-09 14:30:00",
  ),
];
