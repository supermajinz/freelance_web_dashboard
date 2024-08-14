import 'package:dartz/dartz.dart';
import 'package:dash/api%20integration/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> login(String email, String password);
}
