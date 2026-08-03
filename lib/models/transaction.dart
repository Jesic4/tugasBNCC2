abstract class Transaction{
  final String id;
  String title;
  double amount;
  DateTime date;
  String category;
  String? notes;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    this.notes,
  });

  double calculateAmount();
  String transactionType();
  Map<String, dynamic> toMap();
}