import 'package:flutter/material.dart';
import 'package:fyniq/models/transaction.dart';
import 'package:fyniq/services/finance_service.dart';

class FinanceProvider extends ChangeNotifier{
  final FinanceService service = FinanceService();
  List<Transaction> get transactions => service.transactions;
  double get balance => service.getBalance();
  double get totalIncome => service.getIncome();
  double get totalExpense => service.getTotalExpense();

  void add(Transaction t){
    service.addTransaction(t);
    notifyListeners();
  }
}