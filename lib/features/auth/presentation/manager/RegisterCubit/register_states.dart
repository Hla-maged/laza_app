part of 'register_cubit.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final AuthResponse authResponse;

  RegisterSuccess(this.authResponse);
}

final class RegisterFailure extends RegisterState {
  final String error;
  RegisterFailure(this.error);
}
