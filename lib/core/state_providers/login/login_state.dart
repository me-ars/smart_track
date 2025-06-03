part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginWaiting extends LoginState {}

final class LoginSuccessful extends LoginState {
  final String userType;

  LoginSuccessful(this.userType);
}

final class LoginFailed extends LoginState {
  final String error;

  LoginFailed(this.error);
}
