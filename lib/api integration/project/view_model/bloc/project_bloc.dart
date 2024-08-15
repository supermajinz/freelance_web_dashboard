import 'package:bloc/bloc.dart';
import 'package:dash/api%20integration/project/data/repo/project_repo.dart';
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
        (failure) => emit(ProjectFailiur(failure.errMessage)),
        (_) => emit(ProjectDelete()),
      );
    });
  }
}
