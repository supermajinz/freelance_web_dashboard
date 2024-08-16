import 'package:bloc/bloc.dart';
import 'package:dash/api%20integration/auth/auth_repo.dart';
import 'package:dash/api%20integration/auth/token_service.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo _authRepo;
  final AuthTokenService _authTokenService;

  LoginBloc(this._authRepo, this._authTokenService) : super(LoginInitial()) {
    on<Login>((event, emit) async {
      emit(LoginLoading());
      try {
        final result = await _authRepo.login(event.email, event.password);
        await result.fold(
          (failure) async => emit(LoginError(failure.errMessage)),
          (tokens) async {
            await _authTokenService.saveToken(
                'access_token', tokens["access_token"]);
            await _authTokenService.saveToken(
                'refresh_token', tokens["refresh_token"]);
            emit(LoginSuccess());
          },
        );
      } catch (e) {
        emit(LoginError(e.toString()));
      }
    });

    on<Logout>((event, emit) async {
      emit(LogoutLoading()); // New state
      try {
        final result = await _authRepo.logout();
        await result.fold(
          (failure) async => emit(LoginError(failure.errMessage)),
          (_) async {
            await _authTokenService.deleteToken('access_token');
            await _authTokenService.deleteToken('refresh_token');
            emit(LogoutSuccess());
          },
        );
      } catch (e) {
        emit(LoginError(e.toString()));
      }
    });
  }
}
