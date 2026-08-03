import 'package:fyniq/models/transaction.dart';

class ExpenseTransaction extends Transaction {
  ExpenseTransaction({
    required super.id, 
    required super.title, 
    required super.amount, 
    required super.date, 
    required super.category, 
    required super.notes
    });

  @override
  double calculateAmount() {
   return -amount;
  }

  @override
  String transactionType() {
    return "Expense"; 
  }

  @override
  Map<String,dynamic> toMap(){
    return {
      "id": id,
      "title": title,
      "amount": amount,
      "date": date.toString(),
      "category": category,
      "notes": notes,
      "type": "Expense"

    };
  }
}