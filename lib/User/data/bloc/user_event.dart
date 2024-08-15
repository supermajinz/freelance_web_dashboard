part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class SearchForUser extends UserEvent {
  final String phone;

  const SearchForUser(this.phone);
}

class BanUser extends UserEvent {
  final int userId;

  const BanUser(this.userId);
}
