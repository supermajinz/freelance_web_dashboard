part of 'job_titles_bloc.dart';

sealed class JobTitlesState extends Equatable {
  const JobTitlesState();

  @override
  List<Object> get props => [];
}

final class JobTitlesInitial extends JobTitlesState {}

final class JobTitlesLoading extends JobTitlesState {}

final class JobTitlesDelete extends JobTitlesState {}

final class JobTitlesSuccess extends JobTitlesState {
  final JobModel job;

  const JobTitlesSuccess(this.job);

  @override
  List<Object> get props => [job];
}

final class GetJobTitlesSuccess extends JobTitlesState {
  final List<JobModel> jobTitles;

  const GetJobTitlesSuccess(this.jobTitles);

  @override
  List<Object> get props => [jobTitles];
}

final class JobTitlesFailure extends JobTitlesState {
  final String errMessage;

  const JobTitlesFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
