import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fyniq/providers/finance_provider.dart';
import 'package:fyniq/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FinanceProvider()),
      ],
      child: MaterialApp(
        title: 'Fyniq App',
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}