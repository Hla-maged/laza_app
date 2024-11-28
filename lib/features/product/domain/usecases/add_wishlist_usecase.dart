import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/failure.dart';
import '../repos/product_repo.dart';
import 'delete_wishlist_usecase.dart';

class AddWishlistUseCase extends UseCase<void, WishlistParams> {
  final ProductRepo productRepo;

  AddWishlistUseCase({required this.productRepo});

  @override
  Future<Either<Failure, void>> call(WishlistParams params) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    return await productRepo.addWishlist(
        token: token!,
        productId: params.productId,
        image: params.image,
        name: params.name,
        price: params.price);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
