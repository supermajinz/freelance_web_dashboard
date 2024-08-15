part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserError extends UserState {
  final String errorMessage;

  const UserError(this.errorMessage);
}

class UserFound extends UserState {
  final UserModel user;

  const UserFound(this.user);
}

class UserNotFound extends UserState {}

class UserBanned extends UserState {}
