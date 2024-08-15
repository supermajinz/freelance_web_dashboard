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

final class ProjectFailiur extends ProjectState {
  final String errMessage;

  const ProjectFailiur(this.errMessage);
}
