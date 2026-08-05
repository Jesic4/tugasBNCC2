abstract class FinanceTransaction {
  final double _amount;
  final String _note;

  FinanceTransaction(this._amount, this._note);

  double get amount => _amount;
  String get note => _note;

  String getTransactionInfo();
}

class Income extends FinanceTransaction {
  Income(double amount, String note) : super(amount, note);

  @override
  String getTransactionInfo() {
    return "Income: Rp $_amount ($note)";
  }
}

class Expense extends FinanceTransaction {
  Expense(double amount, String note) : super(amount, note);

  @override
  String getTransactionInfo() {
    return "Expense: Rp $_amount ($note)";
  }
}