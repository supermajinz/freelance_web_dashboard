import 'package:dartz/dartz.dart';
import 'package:dash/api%20integration/api_service.dart';
import 'package:dash/api%20integration/failures.dart';
import 'package:dash/User/data/user_model.dart';
import 'package:dash/User/data/users_repo.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart';

class UserRepoImpl extends UsersRepo {
  final ApiService _apiService;

  UserRepoImpl(this._apiService);

  @override
  Future<Either<Failure, UserModel>> searchForUser(String phoneNumber) async {
    try {
      final response = await _apiService.get('users/phone/$phoneNumber');
      return Right(UserModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
