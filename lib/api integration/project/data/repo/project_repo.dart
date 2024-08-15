import 'package:dartz/dartz.dart';

import '../../../failures.dart';

abstract class ProjectRepo {
  Future<Either<Failure, Unit>> deleteProject(int projectId);
}
