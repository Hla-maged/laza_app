import 'package:bloc/bloc.dart';
import 'package:laza_app/features/cart/domain/entities/cart_entity.dart';
import 'package:laza_app/features/cart/domain/usecases/delete_all_cart_usecase.dart';
import 'package:laza_app/features/cart/domain/usecases/delete_cart_usecase.dart';
import 'package:laza_app/features/cart/domain/usecases/fetch_cart_usecase.dart';

import '../../../domain/usecases/add_cart_usecase.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit([
    this.fetchCartUsecase,
    this.addCartUsecase,
    this.deleteCartUsecase,
    this.deleteAllCartUsecase,
  ]) : super(CartInitial());
  final FetchCartUsecase? fetchCartUsecase;
  final AddCartUsecase? addCartUsecase;
  final DeleteCartUsecase? deleteCartUsecase;
  final DeleteAllCartUsecase? deleteAllCartUsecase;

  Future<void> fetchCart() async {
    emit(CartLoading());
    var result = await fetchCartUsecase!.call();
    print('API response: $result');
    result.fold((failure) {
      print('cubit fail ${failure.errMessage}');
      emit(CartFailure(failure.errMessage));
    }, (products) {
      print('cart $products');
      if (products.items.isEmpty) {
        emit(CartEmpty());
      } else {
        emit(CartSuccess(products));
      }
    });
  }

  Future<void> addCart({required String productId}) async {
    emit(CartLoading());
    var result = await addCartUsecase!.call(productId);
    result.fold((failure) {
      print('add cart ${failure.errMessage}');
      emit(CartFailure(failure.errMessage));
    }, (_) async {
      print('add cubit success');
      emit(AddCartSuccess());
      await fetchCart();
    });
  }

  Future<void> deleteCart({required String productId}) async {
    emit(CartLoading());
    var result = await deleteCartUsecase!.call(productId);
    result.fold((failure) {
      emit(CartFailure(failure.errMessage));
    }, (_) async {
      print('remove cubit success');
      await fetchCart();
    });
  }

  Future<void> deleteAllCart() async {
    var result = await deleteAllCartUsecase!.call();
    result.fold((failure) {
      emit(CartFailure(failure.errMessage));
    }, (_) {
      print('clear cart cubit success');
     
      emit(DeleteAllSuccess());
    });
  }
}
