import 'package:dartz/dartz.dart';
import 'package:dash/api%20integration/report/data/model/report_model/report/report.dart';
import 'package:dash/api%20integration/report/data/model/report_model/report_model.dart';

import '../../../failures.dart';

abstract class ReportRepo {
  Future<Either<Failure, Unit>> deleteReporte(int reportId);
  Future<Either<Failure, List<Report>>> fetchReport();
}
