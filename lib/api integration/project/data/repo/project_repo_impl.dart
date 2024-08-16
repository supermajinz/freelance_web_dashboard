import 'package:dartz/dartz.dart';
import 'package:dash/api%20integration/api_service.dart';
import 'package:dash/api%20integration/failures.dart';
import 'package:dash/api%20integration/project/data/repo/project_repo.dart';
import 'package:dash/api%20integration/project/project_model/project_model.dart';
import 'package:dio/dio.dart';

class ProjectRepoImpl implements ProjectRepo {
  final ApiService apiService;

  ProjectRepoImpl(this.apiService);

  @override
  Future<Either<Failure, Unit>> deleteProject(int projectId) async {
    try {
      await apiService.delete('projects/admin/$projectId');
      return const Right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProjectModel>>> searchProjects({
    Map<String, dynamic>? params,
  }) async {
    try {
      var data = await apiService.get('projects', params: params);
      List<ProjectModel> projects = [];
      for (var item in data['projects']) {
        projects.add(ProjectModel.fromJson(item));
      }
      return Right(projects);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
