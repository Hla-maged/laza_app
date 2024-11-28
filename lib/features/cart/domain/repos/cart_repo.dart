import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/cart_entity.dart';

abstract class CartRepo {
  Future<Either<Failure, CartEntity>> getCart({
    required String token,
  });
  Future<Either<Failure, void>> addCart(
      {required String token, required String productId});
  Future<Either<Failure, void>> deleteCart(
      {required String token, required String productId});
  Future<Either<Failure, void>> deleteAllCart({
    required String token,
  });
}
