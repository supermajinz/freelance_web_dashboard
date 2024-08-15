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
  final List<ReportModel> reports;

  const GetReportSuccess(this.reports);

  @override
  List<Object> get props => [reports];
}

final class ReportFailiur extends ReportState {
  final String errMessage;

  const ReportFailiur(this.errMessage);
}
