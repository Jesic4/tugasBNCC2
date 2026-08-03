import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fyniq/providers/finance_provider.dart';
import 'package:fyniq/screens/add_transaction_screen.dart';


class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final finance = context.watch<FinanceProvider>();


    return Scaffold(

      appBar: AppBar(
        title: const Text("Fyniq"),
      ),


      body: Column(

        children: [

          Text(
            "Balance: ${finance.balance}",
          ),
          Text(
            "Income: ${finance.totalIncome}",
          ),
          Text(
            "Expense: ${finance.totalExpense}",
          ),

          Expanded(
            child: ListView.builder(
              itemCount: finance.transactions.length,
              itemBuilder: (context,index){
                final transaction =
                    finance.transactions[index];
                return ListTile(
                  title: Text(transaction.title),
                  subtitle:
                  Text(transaction.transactionType()),
                  trailing:
                  Text(transaction.amount.toString()),
                );
              },
            ),
          ),
        ],
      ),


      floatingActionButton: FloatingActionButton(

        onPressed: (){

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddTransactionScreen(),
            ),
          );
        },


        child: const Icon(Icons.add),

      ),
    );
  }
}