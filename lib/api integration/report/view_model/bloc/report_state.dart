part of 'report_bloc.dart';

sealed class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object> get props => [];
}

final class ReportInitial extends ReportState {}

final class ReportLoading extends ReportState {}

final class ReportDelete extends ReportState {}

final class GetReportSuccess extends ReportState {
  final List<Report> reports;

  const GetReportSuccess(this.reports);

  @override
  List<Object> get props => [reports];
}

final class ReportFailure extends ReportState {
  final String errMessage;

  const ReportFailure(this.errMessage);
}

final class ReportDeleteFailure extends ReportState {
  final String errMessage;

  const ReportDeleteFailure(this.errMessage);
}
