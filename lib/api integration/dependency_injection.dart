import 'package:dash/api%20integration/api_service.dart';
import 'package:dash/api%20integration/auth/auth_repo.dart';
import 'package:dash/api%20integration/auth/auth_repo_impl.dart';
import 'package:dash/api%20integration/auth/token_service.dart';
import 'package:dash/api%20integration/crud/category/data/repo/category_repo.dart';
import 'package:dash/api%20integration/crud/category/data/repo/category_repo_impl.dart';
import 'package:dash/api%20integration/crud/designation/data/repo/jop_repo.dart';
import 'package:dash/api%20integration/crud/designation/data/repo/jop_repo_impl.dart';
import 'package:dash/api%20integration/project/data/repo/project_repo.dart';
import 'package:dash/api%20integration/project/data/repo/project_repo_impl.dart';
import 'package:dash/api%20integration/report/data/repo/report_repo.dart';
import 'package:dash/api%20integration/report/data/repo/report_repo_impl.dart';

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

  static CategoryRepo provideCategoryRepo() {
    return CategoryRepoImpl(provideApiService());
  }

  static ProjectRepo provideProjectRepo() {
    return ProjectRepoImpl(provideApiService());
  }

  static JopRepo provideJobRepo() {
    return JopRepoImpl(provideApiService());
  }

  static ReportRepo provideReportRepo() {
    return ReportRepoImpl(provideApiService());
  }
}
