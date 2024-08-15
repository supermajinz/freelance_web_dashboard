part of 'report_bloc.dart';

sealed class ReportEvent extends Equatable {
  const ReportEvent();

  @override
  List<Object> get props => [];
}

final class GetReports extends ReportEvent {}

final class DeleteReport extends ReportEvent {
  final int reportId;

  const DeleteReport(this.reportId);

  @override
  List<Object> get props => [reportId];
}
