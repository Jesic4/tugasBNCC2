import 'package:flutter/material.dart';
import 'package:fyniq/models/transaction.dart';


class TransactionTile extends StatelessWidget {
  final Transaction transaction;
  const TransactionTile({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context){

    return ListTile(

      title: Text(transaction.title),

      subtitle: Text(
        transaction.transactionType(),
      ),
      trailing: Text(
        transaction.amount.toString(),
      ),
    );
  }
}