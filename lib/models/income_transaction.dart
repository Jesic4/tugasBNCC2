import 'package:fyniq/models/transaction.dart';

class IncomeTransaction extends Transaction {

  IncomeTransaction({
    required super.id,
    required super.title,
    required super.amount,
    required super.date,
    required super.category,
    required super.notes,
  });

  @override
  double calculateAmount() => amount;

  @override
  String transactionType() => "Income";

  @override
  Map<String,dynamic> toMap(){
    return {
      "id": id,
      "title": title,
      "amount": amount,
      "date": date.toString(),
      "category": category,
      "notes": notes,
      "type": "Income"

    };
  }
}