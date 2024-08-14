import 'package:dash/api%20integration/app_router.dart';
import 'package:dash/api%20integration/auth/bloc/login_bloc.dart';
import 'package:dash/api%20integration/dependency_injection.dart';
import 'package:dash/appbar.dart';

import 'package:dash/const/const.dart';
import 'package:dash/dashboardwidget.dart';
import 'package:dash/login.dart';
import 'package:dash/screen/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider(
    create: (context) => LoginBloc(DependencyInjection.provideAuthRepo()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: 'Dashboard ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        brightness: Brightness.dark,
      ),
    );
  }
}
