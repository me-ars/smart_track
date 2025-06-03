import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:smart_track/core/services/auth_service/auth_service.dart';

part 'login_event.dart';
part 'login_state.dart';
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService authService;

  LoginBloc({required this.authService}) : super(LoginInitial()) {
    on<Login>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(Login event, Emitter<LoginState> emit) async {
    emit(LoginWaiting());

    try {
      final userType = await authService.login(
        username: event.username,
        password: event.password,
      );

      emit(LoginSuccessful(userType));
    } on DioException catch (e) {
      final message = e.response?.data['error']['message'] ??
          'Login failed. Please check your credentials.';
      emit(LoginFailed(message));
    } catch (e) {
      emit(LoginFailed('Unexpected error: ${e.toString()}'));
    }
  }
}
