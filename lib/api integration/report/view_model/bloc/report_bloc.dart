import 'package:bloc/bloc.dart';
import 'package:dash/api%20integration/report/data/model/report_model/report/report.dart';
import 'package:dash/api%20integration/report/data/repo/report_repo.dart';
import 'package:equatable/equatable.dart';


part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final ReportRepo repo;
  ReportBloc(this.repo) : super(ReportInitial()) {
    on<GetReports>((event, emit) async {
      emit(ReportLoading());
      final failureOrSuccess = await repo.fetchReport();
      failureOrSuccess.fold(
        (failure) => emit(ReportFailure(failure.errMessage)),
        (report) => emit(GetReportSuccess(report)),
      );
    });

    on<DeleteReport>((event, emit) async {
      emit(ReportLoading());
      final failureOrSuccess = await repo.deleteReporte(event.reportId);
      failureOrSuccess.fold(
        (failure) => emit(ReportFailure(failure.errMessage)),
        (_) => emit(ReportDelete()),
      );
    });
  }
}
