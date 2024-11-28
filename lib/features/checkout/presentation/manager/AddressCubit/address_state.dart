part of 'address_cubit.dart';

sealed class AddressState {}

final class AddressInitial extends AddressState {}

final class AddressLoading extends AddressState {}

final class AddressSuccess extends AddressState {}

final class AddressFailure extends AddressState {
  final String error;

  AddressFailure(this.error);
}
