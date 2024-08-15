import 'package:dartz/dartz.dart';
import 'package:dash/api%20integration/crud/designation/data/model/jop_model.dart';
import '../../../../failures.dart';

abstract class JopRepo {
  Future<Either<Failure, JobModel>> addJobTitle(
      Map<String, dynamic> jopTitleData);
  Future<Either<Failure, Unit>> deleteJobTitle(int jobTitleId);
  Future<Either<Failure, List<JobModel>>> fetchJobTitle();
}
