import 'package:dash/screen/mainscreen.dart';
import 'package:dash/wallets/wallethome.dart';
import 'package:flutter/material.dart';

class cash extends StatefulWidget {
  const cash({super.key});

  @override
  State<cash> createState() => _cashState();
}

class _cashState extends State<cash> {
  double amount = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cash withdraw'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('images/cash.jpg'))),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  amount = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => WalletHome()),
                                    (route) => false);
                              },
                              child: const Text("Yes"),
                            ),
                          ],
                          title: Text("Are You Sure"),
                          contentPadding: const EdgeInsets.all(20),
                          content: const Text(
                              "Are you sure to Cash Withdraw this amount?"),
                        ));
                // Perform balance transfer logic here
              },
              child: Text('Cash withdraw'),
            ),
          ],
        ),
      ),
    );
  }
}
