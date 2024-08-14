import 'package:bloc/bloc.dart';
import 'package:dash/api%20integration/auth/auth_repo.dart';
import 'package:dash/api%20integration/auth/token_service.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo _authRepo;
  LoginBloc(this._authRepo) : super(LoginInitial()) {
    on<Login>((event, emit) async {
      emit(LoginLoading());
      final result = await _authRepo.login(event.email, event.password);
      result.fold((failure) => emit(LoginError(failure.errMessage)),
          (_) => emit(LoginSuccess()));
    });
  }
}
