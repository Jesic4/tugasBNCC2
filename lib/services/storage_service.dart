import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:fyniq/models/transaction.dart';


class StorageService {
  Future<void> saveTransactions(
      List<Transaction> transactions
  ) async {

    final prefs = await SharedPreferences.getInstance();
    List data = transactions
        .map((t)=>t.toMap())
        .toList();

    String jsonData = jsonEncode(data);

    await prefs.setString(
      "transactions",
      jsonData,
    );
  }

  Future<String?> loadTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(
      "transactions",
    );
  }

  Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(
      "transactions",
    );
  }
}