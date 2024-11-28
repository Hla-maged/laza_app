import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:laza_app/features/product/domain/entites/product_entity.dart';
import 'package:laza_app/features/product/domain/entites/review_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repos/product_repo.dart';
import '../datasources/product_remote_data_source.dart';

class ProductRepoImplement implements ProductRepo {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepoImplement({required this.productRemoteDataSource});
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts(
      {required String token, required String categoryId}) async {
    try {
      var products =
          await productRemoteDataSource.getProducts(categoryId: categoryId);
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductDetails(
      {required String token, required String productId}) async {
    try {
      var product =
          await productRemoteDataSource.getProductDetails(productId: productId);
      return right(product);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ReviewEntity>>> getReviews(
      {required String token, required String productId}) async {
    try {
      var reviews =
          await productRemoteDataSource.getReviews(productId: productId);
      return right(reviews);
    } catch (e) {
      print('error');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReviewEntity>> addReview(
      {required String token,
      required String productId,
      required String name,
      required String feedback,
      required double rate}) async {
    try {
      var reviews = await productRemoteDataSource.addReview(
          productId: productId, name: name, feedback: feedback, rate: rate);
      return right(reviews);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addWishlist(
      {required String token,
      required String productId,
      required String name,
      required double price,
      required String image}) async {
    try {
      var product = await productRemoteDataSource.addWishlist(
          productId: productId, image: image, name: name, price: price);
      return right(product);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteWishlist(
      {required String token,
      required String productId,
      required String name,
      required double price,
      required String image}) async {
    try {
      var product = await productRemoteDataSource.deleteWishlist(
          productId: productId, image: image, name: name, price: price);
      return right(product);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getWishlist(
      {required String token}) async {
    try {
      var products = await productRemoteDataSource.getWishlist();
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
