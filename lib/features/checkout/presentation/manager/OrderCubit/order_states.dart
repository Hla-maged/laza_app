part of 'order_cubit.dart';

sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

final class OrderSuccess extends OrderState {
  final List<OrderEntity> orders;

  OrderSuccess(this.orders);
}

final class OrderFailure extends OrderState {
  final String error;

  OrderFailure(this.error);
}

final class OrderEmpty extends OrderState {}

final class OrderConfirmSuccess extends OrderState {}

final class OrderConfirmFailure extends OrderState {
  final String error;

  OrderConfirmFailure(this.error);
}

final class DeleteOrderSuccess extends OrderState {}

final class DeleteOrderFailure extends OrderState {
  final String error;

  DeleteOrderFailure(this.error);

}
