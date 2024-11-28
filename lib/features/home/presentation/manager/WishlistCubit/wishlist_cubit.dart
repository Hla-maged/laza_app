import 'package:bloc/bloc.dart';
import 'package:laza_app/features/product/domain/usecases/fetch_wishlist_usecase.dart';
import '../../../../product/domain/entites/product_entity.dart';
import '../../../../product/domain/usecases/add_wishlist_usecase.dart';
import '../../../../product/domain/usecases/delete_wishlist_usecase.dart';
part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit([
    this.fetchWishlistUseCase,
    this.addWishlistUseCase,
    this.deleteWishlistUseCase,
  ]) : super(FetchWishlistLoading());

  final FetchWishlistUseCase? fetchWishlistUseCase;
  final AddWishlistUseCase? addWishlistUseCase;
  final DeleteWishlistUseCase? deleteWishlistUseCase;

  List<ProductEntity> wishlist = [];

  Future<void> fetchWishlist() async {
    var result = await fetchWishlistUseCase!.call();
    print(result);

    result.fold((failure) {
      emit(FetchWishlistFailure(failure.errMessage));
    }, (wishList) {
      wishlist = wishList;
      if (wishlist.isEmpty) {
        print("Wishlist is empty");
        emit(EmptyWishlist());
      } else {
        emit(FetchWishlistSuccess(wishlist));
      }
    });
  }

  Future<void> addWishlist(
      {required String productId,
      required String name,
      required String image,
      required double price}) async {
    var result = await addWishlistUseCase!.call(WishlistParams(
        productId: productId, name: name, image: image, price: price));

    result.fold((failure) {
      emit(AddWishlistFailure(failure.errMessage));
    }, (_) async {
      wishlist.add(ProductEntity(
        productId: productId,
        productImage: image,
        productName: name,
        productPrice: price,
      ));

      emit(AddWishlistSuccess());
      fetchWishlist();
    });
  }

  Future<void> deleteWishlist(
      {required String productId,
      required String name,
      required String image,
      required double price}) async {
    var result = await deleteWishlistUseCase!.call(WishlistParams(
        productId: productId, name: name, image: image, price: price));

    result.fold((failure) {
      emit(DeleteWishlistFailure(failure.errMessage));
    }, (_) async {
      wishlist.removeWhere((product) => product.productId == productId);

      emit(DeleteWishlistSuccess());
      fetchWishlist();
    });
  }

  bool wished(String productId) {
    return wishlist.any((product) => product.productId == productId);
  }
}
