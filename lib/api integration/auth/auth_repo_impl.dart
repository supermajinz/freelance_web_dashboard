import 'package:dartz/dartz.dart';
import 'package:dash/api%20integration/api_service.dart';
import 'package:dash/api%20integration/auth/auth_repo.dart';
import 'package:dash/api%20integration/auth/token_service.dart';
import 'package:dash/api%20integration/failures.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService _apiService;
  final AuthTokenService _authTokenService;

  AuthRepoImpl(this._apiService, this._authTokenService);
  @override
  Future<Either<Failure, Map<String, dynamic>>> login(
      String email, String password) async {
    try {
      final response = await _apiService
          .post('auth/admin-login', {"email": email, "password": password});
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      await _apiService.post('auth/logout', {});
      return const Right(true);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
