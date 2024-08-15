import 'package:dartz/dartz.dart';
import 'package:dash/api%20integration/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, Map<String, dynamic>>> login(
      String email, String password);
  Future<Either<Failure, bool>> logout();
}
