import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  //bwt ngmbil teks pke texteditingcont
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  //smpn plihanny nnt
  String _selectedType = 'income';

  @override
  void dispose(){
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Transaction"),
        backgroundColor: Colors.teal,
      ),
      //biar g nempel ke piggir lyr
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //nominal
            const Text('Nominal (Rp)', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Example: 50000',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            //catatan/note
            const Text('Notes', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _noteController,
              decoration: const InputDecoration(
                hintText: 'Example: Buy Supplies',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            //dropdown
            const Text('Tipe Transaksi', style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: _selectedType,
              isExpanded: true, // Biar dropdown-nya panjang mnuhin layar
              items: const [
                DropdownMenuItem(value: 'income', child: Text('Pemasukan')),
                DropdownMenuItem(value: 'expense', child: Text('Pengeluaran')),
              ],
              // user milih opsi lain
              onChanged: (String? newValue) {
                setState(() {
                  _selectedType = newValue!;
                });
              },
            ),
            const SizedBox(height: 40),
            //save button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: (){
                  String amount = _amountController.text;
                  String note = _noteController.text;

                  print('Type: $_selectedType');
                  print('Amount: Rp $amount');
                  print('Notes: $note');

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Succesfully saved: Rp $amount ($note)')),

                  );
                },
                child: const Text('Save Data', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            )
          ],
        ),
      ),
    );
  }
}