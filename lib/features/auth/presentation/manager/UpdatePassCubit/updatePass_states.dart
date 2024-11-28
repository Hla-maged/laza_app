part of 'updatePass_cubit.dart';

sealed class UpdatePassState {}

final class UpdatePassInitial extends UpdatePassState {}

final class UpdatePassLoading extends UpdatePassState {}

final class UpdatePassSuccess extends UpdatePassState {}

final class UpdatePassFailure extends UpdatePassState {
  final String error;
  UpdatePassFailure(this.error);
}
