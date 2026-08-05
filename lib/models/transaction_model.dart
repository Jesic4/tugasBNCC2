class TransactionModel {
  final int? id;
  final String type;
  final String category;
  final double amount;
  final String note;
  final String date;

  TransactionModel({
    this.id,
    required this.type,
    required this.category,
    required this.amount,
    required this.note,
    required this.date,
  });

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'],
      type: map['type'],
      category: map['category'],
      amount: map['amount'],
      note: map['note'],
      date: map['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'category': category,
      'amount': amount,
      'note': note,
      'date': date,
    };
  }
}