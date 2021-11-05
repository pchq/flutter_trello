import 'package:bloc/bloc.dart';
import 'package:layer_domain/layer_domain.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository authRepository;
  AuthCubit({
    required this.authRepository,
  }) : super(AuthInitial());

  void login({
    required String username,
    required String password,
  }) async {
    if (state is AuthLoading) return;

    try {
      emit(AuthLoading());
      await authRepository.login(username: username, password: password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError('$e'));
    }
  }

  void logout() {
    authRepository.logout();
  }

  void checkAuth() async {
    emit(AuthInitial());
    await Future(
        () => emit(authRepository.isLogined() ? AuthSuccess() : AuthError('No authorization')));
  }
}
