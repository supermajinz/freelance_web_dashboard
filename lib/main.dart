import 'package:dash/api%20integration/app_router.dart';
import 'package:dash/api%20integration/auth/bloc/login_bloc.dart';
import 'package:dash/api%20integration/crud/category/view_model/bloc/category_skill_bloc.dart';
import 'package:dash/api%20integration/crud/designation/view_model/bloc/job_titles_bloc.dart';
import 'package:dash/api%20integration/dependency_injection.dart';
import 'package:dash/api%20integration/project/view_model/bloc/project_bloc.dart';
import 'package:dash/api%20integration/report/view_model/bloc/report_bloc.dart';
import 'package:dash/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => LoginBloc(DependencyInjection.provideAuthRepo()),
      ),
      BlocProvider(
          create: (context) =>
              CategorySkillBloc(DependencyInjection.provideCategoryRepo())
                ..add(GetCategoriesEvent())),
      BlocProvider(
          create: (context) =>
              ReportBloc(DependencyInjection.provideReportRepo())),
      BlocProvider(
          create: (context) =>
              JobTitlesBloc(DependencyInjection.provideJobRepo())),
      BlocProvider(
          create: (context) =>
              ProjectBloc(DependencyInjection.provideProjectRepo())),
    ],
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
