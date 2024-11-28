import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:laza_app/core/errors/failure.dart';
import 'package:laza_app/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:laza_app/features/cart/domain/repos/cart_repo.dart';

import '../../domain/entities/cart_entity.dart';

class CartRepoImplement implements CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepoImplement({required this.cartRemoteDataSource});
  @override
  Future<Either<Failure, CartEntity>> getCart({required String token}) async {
    try {
      print('true');
      var products = await cartRemoteDataSource.getCart();
      print('products $products');
      return right(products);
    } catch (e) {
      print('e');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addCart(
      {required String token, required String productId}) async {
    try {
      var product = await cartRemoteDataSource.addCart(productId: productId);
      print('Add to cart successful');
      return right(product);
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> deleteCart(
      {required String token, required String productId}) async {
    try {
      print('true');
      var product = await cartRemoteDataSource.deleteCart(productId: productId);
      print('remove from cart successful');
      return right(product);
    } catch (e) {
      print('e');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAllCart({required String token}) async {
    try {
      print('true');
      var product = await cartRemoteDataSource.deleteAllCart();
      print('clear cart successful');
      return right(product);
    } catch (e) {
      print('e');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
