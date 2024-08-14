import 'package:dash/api%20integration/api_service.dart';
import 'package:dash/api%20integration/auth/token_service.dart';
import 'package:dash/api%20integration/crud/category/data/repo/category_repo.dart';
import 'package:dash/api%20integration/crud/category/data/repo/category_repo_impl.dart';

class DependencyInjection {
  static const String baseUrl = "http://localhost:8080/api/v1/";
  static AuthTokenService provideAuthTokenService() {
    return AuthTokenService();
  }

  static ApiService provideApiService() {
    final authTokenService = provideAuthTokenService();
    return ApiService(
      baseUrl: 'http://10.0.2.2:8080/api/v1/',
      authTokenService: authTokenService,
    );
  }

  static CategoryRepo provideCategoyrRepo() {
    final apiService = provideApiService();
    return CategoryRepoImpl(apiService);
  }
}
