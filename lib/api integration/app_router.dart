import 'package:dash/login.dart';
import 'package:dash/screen/mainscreen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/mainScreen',
      builder: (context, state) => const MainScreen(),
    ),
  ]);
}
