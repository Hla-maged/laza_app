part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

//for fetch

final class CartSuccess extends CartState {
  final CartEntity cart;

  CartSuccess(this.cart);
}

final class CartEmpty extends CartState {}

final class CartFailure extends CartState {
  final String error;
  CartFailure(this.error);
}

//for add

final class AddCartSuccess extends CartState {}

// for delete

final class DeleteSuccess extends CartState {}

//for clear

final class DeleteAllSuccess extends CartState {}
