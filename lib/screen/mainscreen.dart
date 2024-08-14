import 'package:dash/dashboardwidget.dart';
import 'package:dash/summarywidget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          Expanded(
            flex: 8,
            child: DashboardWidget(),
          ),
        ],
      )),
    );
  }
}
