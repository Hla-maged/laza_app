import 'package:bloc/bloc.dart';
import 'package:laza_app/features/checkout/domain/usecases/delete_order_usecase.dart';

import '../../../domain/entities/order_entity.dart';
import '../../../domain/usecases/get_orders_usecase.dart';
import '../../../domain/usecases/order_confirm_usecase.dart';

part 'order_states.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderConfirmUsecase? orderConfirmUsecase;
  final FetchOrderUsecase? fetchOrderUsecase;
  final DeleteOrderUsecase? deleteOrderUsecase;
  OrderCubit(
      [this.orderConfirmUsecase,
      this.fetchOrderUsecase,
      this.deleteOrderUsecase])
      : super(OrderLoading());

  List<OrderEntity>? orders;
  Future<void> fetchOrders() async {
    var result = await fetchOrderUsecase!.call();
    result.fold((failure) {
      print('cubit fail ${failure.errMessage}');
      emit(OrderFailure(failure.errMessage));
    }, (products) {
      orders = products;
      if (orders == null || orders!.isEmpty) {
        emit(OrderEmpty());
      } else {
        print('Order fetched successfully: $orders');
        emit(OrderSuccess(orders!));
      }
    });
  }

  Future<void> orderConfirm() async {
    var result = await orderConfirmUsecase!.call();
    result.fold((failure) {
      emit(OrderConfirmFailure(failure.errMessage));
    }, (_) async {
      print('order confirm cubit success');
      emit(OrderConfirmSuccess());
    });
  }

  Future<void> deleteOrder({required String orderId}) async {
    emit(OrderLoading());
    var result = await deleteOrderUsecase!.call(orderId);
    result.fold((failure) {
      emit(DeleteOrderFailure(failure.errMessage));
    }, (_) async {
      print('remove order success');
      await fetchOrders();
    });
  }
}
