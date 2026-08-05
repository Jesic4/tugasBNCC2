import 'package:flutter/material.dart';
import 'models/transaction.dart';          
import 'models/transaction_model.dart';     
import 'database/database_helper.dart';   
import 'screens/transaction/add_transaction.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Moru',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moru - Home Screen'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo.png',
              width: 150,
              height: 150,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, size: 100),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Moru!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailScreen()),
                );
              },
              child: const Text('View Transactions'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal.shade700),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddTransaction()),
                );
              },
              child: const Text('Add new transaction 📝', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction list'),
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<List<TransactionModel>>(
        future: DatabaseHelper.instance.getAllTransactions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No transactions yet \nTry to add first.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          final transactionsFromDB = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: transactionsFromDB.length,
            itemBuilder: (context, index) {
              final item = transactionsFromDB[index];
              FinanceTransaction transactionOOP;

              if (item.type == 'income') {
                transactionOOP = Income(item.amount, item.note);
              } else {
                transactionOOP = Expense(item.amount, item.note);
              }

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                elevation: 2,
                child: ListTile(
                  leading: Icon(
                    item.type == 'income' ? Icons.arrow_downward : Icons.arrow_upward,
                    color: item.type == 'income' ? Colors.green : Colors.red,
                  ),
                  title: Text(
                    transactionOOP.getTransactionInfo(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Tanggal: ${item.date.substring(0, 10)}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}