import 'package:dash/login.dart';
import 'package:dash/screen/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:dash/api%20integration/auth/token_service.dart';
import 'package:go_router/go_router.dart';

class AuthenticationWrapper extends StatelessWidget {
  final AuthTokenService authTokenService;

  const AuthenticationWrapper({Key? key, required this.authTokenService})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: authTokenService.isAuthenticated(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasData && snapshot.data == true) {
          return const MainScreen();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
