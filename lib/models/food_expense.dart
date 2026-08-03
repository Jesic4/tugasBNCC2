import 'package:fyniq/models/expense_transaction.dart';

class FoodExpense extends ExpenseTransaction{
  FoodExpense({
    required super.id, 
    required super.title, 
    required super.amount, 
    required super.date, 
    //required super.category, 
    required super.notes
    }) : super(category: "Food");
}