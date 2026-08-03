import 'package:fyniq/models/expense_transaction.dart';

class ShoppingExpense extends ExpenseTransaction{
  ShoppingExpense({
    required super.id, 
    required super.title, 
    required super.amount, 
    required super.date, 
    //required super.category, 
    required super.notes
    }) : super(category: "Shopping");
}