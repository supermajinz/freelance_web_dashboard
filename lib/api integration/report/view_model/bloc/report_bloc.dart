import 'package:bloc/bloc.dart';
import 'package:dash/api%20integration/report/data/repo/report_repo.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/report_model/report_model.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final ReportRepo repo;
  ReportBloc(this.repo) : super(ReportInitial()) {
    on<GetReports>((event, emit) async {
      emit(ReportLoading());
      final failureOrSuccess = await repo.fetchReport();
      failureOrSuccess.fold(
        (failure) => emit(ReportFailiur(failure.errMessage)),
        (report) => emit(GetReportSuccess(report)),
      );
    });

    on<DeleteReport>((event, emit) async {
      emit(ReportLoading());
      final failureOrSuccess = await repo.deleteReporte(event.reportId);
      failureOrSuccess.fold(
        (failure) => emit(ReportFailiur(failure.errMessage)),
        (_) => emit(ReportDelete()),
      );
    });
  }
}
