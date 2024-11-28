part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final AuthResponse authResponse;

  LoginSuccess(this.authResponse);
}

final class LoginFailure extends LoginState {
  final String error;
  LoginFailure(this.error);
}
