class BudgetModel {
  final int id;
  final String category;
  final double budget;
  final double expense;
  final String datetime;

  BudgetModel({
    required this.id,
    required this.category,
    required this.budget,
    required this.expense,
    required this.datetime,
  });
}

final List<BudgetModel> budgetList = [
  BudgetModel(id: 1, category: 'Shopping', budget: 1000, expense: 1200, datetime: '2023-03-01 14:30:00'),
  BudgetModel(id: 2, category: 'Transportation', budget: 700, expense: 350, datetime: '2023-03-01 14:30:00'),
  BudgetModel(id: 3, category: 'Food', budget: 700, expense: 650, datetime: '2023-04-01 14:30:00'),
  BudgetModel(id: 4, category: 'Subscription', budget: 100, expense: 50, datetime: '2023-04-01 14:30:00'),
  BudgetModel(id: 5, category: 'Transportation', budget: 200, expense: 220, datetime: '2023-04-01 14:30:00'),
  BudgetModel(id: 6, category: 'Food', budget: 350, expense: 355, datetime: '2023-05-01 14:30:00'),
  BudgetModel(id: 7, category: 'Transportation', budget: 200, expense: 195, datetime: '2023-06-01 14:30:00'),
  BudgetModel(id: 8, category: 'Food', budget: 200, expense: 220, datetime: '2023-07-01 14:30:00'),
  BudgetModel(id: 9, category: 'Transportation', budget: 200, expense: 195, datetime: '2023-07-01 14:30:00'),
  BudgetModel(id: 10, category: 'Subscription', budget: 100, expense: 90, datetime: '2023-07-01 14:30:00'),
  BudgetModel(id: 11, category: 'Shopping', budget: 900, expense: 950, datetime: '2023-08-01 14:30:00'),
  BudgetModel(id: 12, category: 'Transportation', budget: 200, expense: 185, datetime: '2023-08-01 14:30:00'),
  BudgetModel(id: 13, category: 'Subscription', budget: 100, expense: 80, datetime: '2023-08-01 14:30:00'),
  BudgetModel(id: 14, category: 'Food', budget: 200, expense: 180, datetime: '2023-09-01 14:30:00'),
  BudgetModel(id: 15, category: 'Shopping', budget: 500, expense: 710, datetime: '2023-09-01 14:30:00'),
  BudgetModel(id: 16, category: 'Shopping', budget: 500, expense: 220, datetime: '2023-10-01 14:30:00'),
  BudgetModel(id: 17, category: 'Food', budget: 350, expense: 360, datetime: '2023-10-01 14:30:00'),
  BudgetModel(id: 18, category: 'Transportation', budget: 300, expense: 220, datetime: '2023-10-01 14:30:00'),
];
