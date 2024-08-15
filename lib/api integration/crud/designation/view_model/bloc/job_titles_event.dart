part of 'job_titles_bloc.dart';

sealed class JobTitlesEvent extends Equatable {
  const JobTitlesEvent();

  @override
  List<Object> get props => [];
}

final class AddjobTitle extends JobTitlesEvent {
  final Map<String, dynamic> addjobTitleData;

  const AddjobTitle(this.addjobTitleData);

  @override
  List<Object> get props => [addjobTitleData];
}

final class GetjobTitle extends JobTitlesEvent {}

final class DeleteJobTitle extends JobTitlesEvent {
  final int jobTitleId;

  const DeleteJobTitle(this.jobTitleId);

  @override
  List<Object> get props => [jobTitleId];
}
