import 'package:fyniq/models/expense_transaction.dart';
import 'package:fyniq/models/income_transaction.dart';
import 'package:fyniq/models/transaction.dart';
import 'package:fyniq/services/storage_service.dart';

class FinanceService {
  final StorageService storage = StorageService();

  final List<Transaction> _transactions = [];
  List<Transaction> get transactions => _transactions;

  void addTransaction(Transaction transaction){
    _transactions.add(transaction);
    storage.saveTransactions(_transactions);
  }

  void removeTransaction(String id){
    _transactions.removeWhere((t)=>t.id==id);
  }

  double getBalance(){
    double total = 0;
    for(var t in _transactions){
      total += t.calculateAmount();
    }
    return total;
  }

  double getIncome(){
    double total = 0;
    for(var t in _transactions){
      if(t is IncomeTransaction){
        total += t.amount;
      }
    }
    return total;
  }

  double getTotalExpense(){
    double total = 0;
    for(var t in _transactions){
      if(t is ExpenseTransaction){
        total += t.amount;
      }
    }
    return total;
  }
}