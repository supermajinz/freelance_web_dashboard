import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dash/User/data/user_model.dart';
import 'package:dash/User/data/users_repo.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepo _userRepo;
  UserBloc(this._userRepo) : super(UserInitial()) {
    on<SearchForUser>(_searchForUser);
  }

  FutureOr<void> _searchForUser(
      SearchForUser event, Emitter<UserState> emit) async {
    emit(UserLoading());
    final result = await _userRepo.searchForUser(event.phone);
    result.fold((failure) => emit(UserError(failure.errMessage)),
        (user) => emit(UserFound(user)));
  }
}
