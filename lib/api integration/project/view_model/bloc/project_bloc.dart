import 'package:bloc/bloc.dart';
import 'package:dash/api%20integration/project/data/repo/project_repo.dart';
import 'package:dash/api%20integration/project/project_model/project_model.dart';
import 'package:equatable/equatable.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final ProjectRepo repo;
  ProjectBloc(this.repo) : super(ProjectInitial()) {
    on<DeleteProject>((event, emit) async {
      emit(ProjectLoading());
      final failureOrSuccess = await repo.deleteProject(event.projectId);
      failureOrSuccess.fold(
        (failure) => emit(ProjectFailure(failure.errMessage)),
        (_) => emit(ProjectDelete()),
      );
    });
    on<SearchProjectsEvent>((event, emit) async {
      emit(ProjectLoading());
      final result = await repo.searchProjects(params: event.filters);

      result.fold(
        (failure) => emit(ProjectFailure(failure.errMessage)),
        (projects) => emit(SearchSuccess(projects)),
      );
    });
  }
}
