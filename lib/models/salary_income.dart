import 'package:fyniq/models/income_transaction.dart';

class SalaryIncome extends IncomeTransaction{
  SalaryIncome({
    required super.id, 
    required super.title, 
    required super.amount, 
    required super.date, 
    //required super.category, 
    required super.notes
    }) : super(category: "Salary");
}