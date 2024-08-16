part of 'project_bloc.dart';

sealed class ProjectState extends Equatable {
  const ProjectState();

  @override
  List<Object> get props => [];
}

final class ProjectInitial extends ProjectState {}

final class ProjectLoading extends ProjectState {}

final class ProjectDelete extends ProjectState {}

// final class GetProjectSuccess extends ProjectState {
//   final List<ProjectModel> project;

//   const GetProjectSuccess(this.project);

//   @override
//   List<Object> get props => [project];
// }

final class ProjectFailure extends ProjectState {
  final String errMessage;

  const ProjectFailure(this.errMessage);
}

class SearchSuccess extends ProjectState {
  final List<ProjectModel> projects;

  const SearchSuccess(this.projects);

  @override
  List<Object> get props => [projects];
}

final class ProjectDeleteFailure extends ProjectState {
  final String errMessage;

  const ProjectDeleteFailure(this.errMessage);
}
