class BudgetModel {
  final int id;
  final String category;
  final double budget;
  final double expense;

  BudgetModel({
    required this.id,
    required this.category,
    required this.budget,
    required this.expense,
  });
}

final List<BudgetModel> budgetList = [
  BudgetModel(id: 1, category: 'Shopping', budget: 1000, expense: 1200),
  BudgetModel(id: 2, category: 'Transportation', budget: 700, expense: 350),
  BudgetModel(id: 3, category: 'Food', budget: 700, expense: 650),
  BudgetModel(id: 4, category: 'Subscription', budget: 200, expense: 220),
];
