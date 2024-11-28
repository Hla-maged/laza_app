import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repos/product_repo.dart';

class DeleteWishlistUseCase extends UseCase<void, WishlistParams> {
  final ProductRepo productRepo;

  DeleteWishlistUseCase({required this.productRepo});

  @override
  Future<Either<Failure, void>> call(WishlistParams params) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return await productRepo.deleteWishlist(
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

class WishlistParams {
  final String productId, name, image;
  final double price;

  WishlistParams({
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
  });
}
