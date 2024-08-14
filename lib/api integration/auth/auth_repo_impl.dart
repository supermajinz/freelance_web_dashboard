import 'package:dartz/dartz.dart';
import 'package:dash/api%20integration/api_service.dart';
import 'package:dash/api%20integration/auth/auth_repo.dart';
import 'package:dash/api%20integration/failures.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService _apiService;

  AuthRepoImpl(this._apiService);
  @override
  Future<Either<Failure, String>> login(String email, String password) async {
    try {
      final response = await _apiService
          .post('auth/admin-login', {"email": email, "password": password});
      return Right(response['message']);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
