import 'package:dash/addskills.dart';
//import 'package:dash/appbar.dart';
//import 'package:dash/dashboardwidget.dart';
import 'package:dash/screen/mainscreen.dart';
//import 'package:dash/screen/transfer.dart';
import 'package:dash/screen/users.dart';
import 'package:dash/wallets/wallethome.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(20),
            height: 300,
            decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('images/iconlogin.jpg'))),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              MainScreen;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainScreen()));
              // Add login functionality here
              // For example, you can check the credentials and navigate to a new screen
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
