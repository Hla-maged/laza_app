part of 'forgetPass_cubit.dart';

sealed class ForgetPassState {}

final class ForgetPassInitial extends ForgetPassState {}

final class ForgetPassLoading extends ForgetPassState {}

final class ForgetPassSuccess extends ForgetPassState {}

final class ForgetPassFailure extends ForgetPassState {
  final String error;
  ForgetPassFailure(this.error);
}
