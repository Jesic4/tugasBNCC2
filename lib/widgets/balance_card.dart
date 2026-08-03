import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final double balance;
  const BalanceCard({
    super.key,
    required this.balance,
  });

  @override
  Widget build(BuildContext context){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Text(
          "Balance: $balance",
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );

  }
}