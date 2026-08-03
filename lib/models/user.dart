class User {
  String _name;
  double _balance = 0;

  User(this._name);
  String get name=> _name;
  double get balance=> _balance;

  void deposit(double amount){
    if(amount>0){
      _balance+=amount;
    }
  }

  void withdraw(double amount){
    if(amount>0 && amount <=_balance){
      _balance -= amount;
    }
  }

}