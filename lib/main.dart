import 'package:dash/Wallet/data/bloc/wallet_bloc.dart';
import 'package:dash/api%20integration/app_router.dart';
import 'package:dash/api%20integration/auth/bloc/login_bloc.dart';
import 'package:dash/api%20integration/crud/category/view_model/bloc/category_skill_bloc.dart';
import 'package:dash/api%20integration/crud/designation/view_model/bloc/job_titles_bloc.dart';
import 'package:dash/api%20integration/auth/token_service.dart';
import 'package:dash/api%20integration/dependency_injection.dart';
import 'package:dash/api%20integration/project/view_model/bloc/project_bloc.dart';
import 'package:dash/api%20integration/report/view_model/bloc/report_bloc.dart';
import 'package:dash/User/data/bloc/user_bloc.dart';
import 'package:dash/appbar.dart';

import 'package:dash/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final authTokenService = AuthTokenService();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => LoginBloc(DependencyInjection.provideAuthRepo(),
            DependencyInjection.provideAuthTokenService()),
      ),
      BlocProvider(
        create: (context) => UserBloc(DependencyInjection.provideUserRepo()),
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
      BlocProvider(
        create: (context) =>
            WalletBloc(DependencyInjection.provideWalletRepp()),
      ),
    ],
    child: MyApp(authTokenService: authTokenService),
  ));
}

class MyApp extends StatelessWidget {
  final AuthTokenService authTokenService;

  const MyApp({Key? key, required this.authTokenService}) : super(key: key);

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
