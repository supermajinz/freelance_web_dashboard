import 'package:dash/api%20integration/api_service.dart';
import 'package:dash/api%20integration/auth/auth_repo.dart';
import 'package:dash/api%20integration/auth/auth_repo_impl.dart';
import 'package:dash/api%20integration/auth/token_service.dart';

class DependencyInjection {
  static const String baseUrl = 'http://localhost:8080/api/v1/';
  static AuthTokenService provideAuthTokenService() {
    return AuthTokenService();
  }

  static ApiService provideApiService() {
    return ApiService(
        baseUrl: baseUrl, authTokenService: provideAuthTokenService());
  }

  static AuthRepo provideAuthRepo() {
    return AuthRepoImpl(provideApiService(), provideAuthTokenService());
  }
}
