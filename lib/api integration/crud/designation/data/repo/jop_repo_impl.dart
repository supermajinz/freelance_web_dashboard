import 'package:dartz/dartz.dart';
import 'package:dash/api%20integration/api_service.dart';
import 'package:dash/api%20integration/crud/designation/data/model/jop_model.dart';
import 'package:dash/api%20integration/crud/designation/data/repo/jop_repo.dart';
import 'package:dash/api%20integration/failures.dart';
import 'package:dio/dio.dart';

class JopRepoImpl implements JopRepo {
  final ApiService apiService;

  JopRepoImpl(this.apiService);
  @override
  Future<Either<Failure, JobModel>> addJobTitle(
      Map<String, dynamic> jopTitleData) async {
    try {
      final response = await apiService.post('job-titles', jopTitleData);
      final project = JobModel.fromJson(response);
      return Right(project);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteJobTitle(int jobTitleId) async {
    try {
      await apiService.delete('job-titles/$jobTitleId');
      return const Right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<JobModel>>> fetchJobTitle() async {
    try {
      var data = await apiService.get('job-titles');
      List<JobModel> jobTitles = [];
      for (var item in data['jobTitles']) {
        jobTitles.add(JobModel.fromJson(item));
      }
      return right(jobTitles);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
