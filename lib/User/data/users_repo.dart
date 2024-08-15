import 'package:dartz/dartz.dart';
import 'package:dash/api%20integration/failures.dart';
import 'package:dash/User/data/user_model.dart';

abstract class UsersRepo {
  Future<Either<Failure, UserModel>> searchForUser(String phoneNumber);
}
