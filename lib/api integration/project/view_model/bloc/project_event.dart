part of 'project_bloc.dart';

sealed class ProjectEvent extends Equatable {
  const ProjectEvent();

  @override
  List<Object> get props => [];
}

final class DeleteProject extends ProjectEvent {
  final int projectId;

  const DeleteProject(this.projectId);

  @override
  List<Object> get props => [projectId];
}
