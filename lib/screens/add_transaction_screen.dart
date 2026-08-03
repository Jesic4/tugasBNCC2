import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fyniq/models/salary_income.dart';
import 'package:fyniq/models/food_expense.dart';
import 'package:fyniq/providers/finance_provider.dart';


class AddTransactionScreen extends StatelessWidget {


  const AddTransactionScreen({super.key});


  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title: const Text("Add Transaction"),
      ),


      body: Column(

        children: [


          ElevatedButton(

            onPressed: (){


              final income = SalaryIncome(

                id: DateTime.now()
                    .toString(),
                title: "Salary",
                amount: 5000000,
                date: DateTime.now(),
                notes: "",
              );


              context
                  .read<FinanceProvider>()
                  .add(income);


              Navigator.pop(context);


            },


            child: const Text(
              "Add Income",
            ),

          ),



          ElevatedButton(

            onPressed: (){


              final expense = FoodExpense(

                id: DateTime.now()
                    .toString(),
                title: "Food",
                amount: 50000,
                date: DateTime.now(),
                notes: "",

              );


              context
                  .read<FinanceProvider>()
                  .add(expense);


              Navigator.pop(context);


            },


            child: const Text(
              "Add Expense",
            ),

          ),


        ],

      ),

    );

  }
}