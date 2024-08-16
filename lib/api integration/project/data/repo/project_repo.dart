import 'package:dartz/dartz.dart';
import 'package:dash/api%20integration/project/project_model/project_model.dart';

import '../../../failures.dart';

abstract class ProjectRepo {
  Future<Either<Failure, Unit>> deleteProject(int projectId);
  Future<Either<Failure, List<ProjectModel>>> searchProjects({
    Map<String, dynamic>? params,
  });
}
