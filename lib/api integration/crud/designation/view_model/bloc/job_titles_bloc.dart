import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/model/jop_model.dart';
import '../../data/repo/jop_repo.dart';

part 'job_titles_event.dart';
part 'job_titles_state.dart';

class JobTitlesBloc extends Bloc<JobTitlesEvent, JobTitlesState> {
  final JopRepo jopRepo;

  JobTitlesBloc(this.jopRepo) : super(JobTitlesInitial()) {
    on<AddjobTitle>((event, emit) async {
      emit(JobTitlesLoading());
      final failureOrSuccess = await jopRepo.addJobTitle(event.addjobTitleData);
      failureOrSuccess.fold(
        (failure) => emit(JobTitlesFailure(failure.errMessage)),
        (job) => emit(JobTitlesSuccess(job)),
      );
    });

    on<GetjobTitle>((event, emit) async {
      emit(JobTitlesLoading());
      final failureOrSuccess = await jopRepo.fetchJobTitle();
      failureOrSuccess.fold(
        (failure) => emit(JobTitlesFailure(failure.errMessage)),
        (jobTitles) => emit(GetJobTitlesSuccess(jobTitles)),
      );
    });

    on<DeleteJobTitle>((event, emit) async {
      emit(JobTitlesLoading());
      final failureOrSuccess = await jopRepo.deleteJobTitle(event.jobTitleId);
      failureOrSuccess.fold(
        (failure) => emit(JobTitlesFailure(failure.errMessage)),
        (_) => emit(JobTitlesDelete()),
      );
    });
  }
}
