import 'package:dash/appbar.dart';

import 'package:dash/const/const.dart';
import 'package:dash/dashboardwidget.dart';
import 'package:dash/login.dart';
import 'package:dash/screen/mainscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dashboard ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          brightness: Brightness.dark,
        ),
        home: LoginPage());
  }
}
