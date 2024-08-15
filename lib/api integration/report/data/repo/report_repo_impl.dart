import 'package:dartz/dartz.dart';
import 'package:dash/api%20integration/api_service.dart';
import 'package:dash/api%20integration/failures.dart';
import 'package:dash/api%20integration/report/data/model/report_model/report_model.dart';
import 'package:dash/api%20integration/report/data/repo/report_repo.dart';
import 'package:dio/dio.dart';

class ReportRepoImpl implements ReportRepo {
  final ApiService apiService;

  ReportRepoImpl(this.apiService);

  @override
  Future<Either<Failure, Unit>> deleteReporte(int reportId) async {
    try {
      await apiService.delete('reports/$reportId');
      return const Right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ReportModel>>> fetchReport() async {
    try {
      var data = await apiService.get('reports');
      List<ReportModel> jobTitles = [];
      for (var item in data['']) {
        jobTitles.add(ReportModel.fromJson(item));
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
