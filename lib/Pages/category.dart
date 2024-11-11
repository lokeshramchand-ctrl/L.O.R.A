class Category {
  final String name;
  final double amountSpent;

  Category({required this.name, required this.amountSpent});
  List<Category> categories = [
    Category(name: 'Food', amountSpent: 150.0),
    Category(name: 'Entertainment', amountSpent: 100.0),
    Category(name: 'Transport', amountSpent: 80.0),
    Category(name: 'Utilities', amountSpent: 60.0),
  ];
}
