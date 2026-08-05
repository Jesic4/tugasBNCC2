import '../models/transaction_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  DatabaseHelper._init();

  // MOCK DATABASE doang
  static final List<TransactionModel> _mockDatabase = [];
  static int _idCounter = 1;

  Future<int> insertTransaction(TransactionModel transaction) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final newTransaction = TransactionModel(
      id: _idCounter++,
      type: transaction.type,
      category: transaction.category,
      amount: transaction.amount,
      note: transaction.note,
      date: transaction.date,
    );
    
    _mockDatabase.add(newTransaction);
    return newTransaction.id!;
  }

  Future<List<TransactionModel>> getAllTransactions() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockDatabase.reversed.toList();
  }
}