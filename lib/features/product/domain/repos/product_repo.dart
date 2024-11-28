import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/failure.dart';
import 'package:laza_app/features/product/domain/entites/product_entity.dart';

import '../entites/review_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts(
      {required String token, required String categoryId});
  Future<Either<Failure, ProductEntity>> getProductDetails(
      {required String token, required String productId});
  Future<Either<Failure, List<ReviewEntity>>> getReviews(
      {required String token, required String productId});
  Future<Either<Failure, ReviewEntity>> addReview(
      {required String token,
      required String productId,
      required String name,
      required String feedback,
      required double rate});
  Future<Either<Failure, List<ProductEntity>>> getWishlist(
      {required String token});
  Future<Either<Failure, void>> addWishlist(
      {required String token,
      required String productId,
      required String name,
      required double price,
      required String image});
  Future<Either<Failure, void>> deleteWishlist(
      {required String token,
      required String productId,
      required String name,
      required double price,
      required String image});
}
