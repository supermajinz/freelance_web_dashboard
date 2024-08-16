import 'package:dash/api%20integration/auth/auth_wrapper.dart';
import 'package:dash/api%20integration/auth/token_service.dart';
import 'package:dash/api%20integration/dependency_injection.dart';
import 'package:dash/login.dart';
import 'package:dash/screen/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => AuthenticationWrapper(
            authTokenService: DependencyInjection.provideAuthTokenService()),
      ),
      GoRoute(
        path: '/mainScreen',
        builder: (context, state) => MainScreen(index: state.extra as int?),
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) async {
      final isAuthenticated =
          await DependencyInjection.provideAuthTokenService().isAuthenticated();
      if (!isAuthenticated && state.uri.toString() != '/') {
        return '/';
      }
      if (isAuthenticated && state.uri.toString() == '/') {
        return '/mainScreen';
      }
      return null;
    },
  );
}
