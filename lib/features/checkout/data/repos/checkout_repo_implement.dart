import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:laza_app/core/errors/failure.dart';
import 'package:laza_app/features/checkout/data/datasources/checkout_remote_data_source.dart';
import 'package:laza_app/features/checkout/domain/entities/order_entity.dart';
import 'package:laza_app/features/checkout/domain/repos/checkout_repo.dart';

import '../../domain/entities/card_entity.dart';

class CheckoutRepoImplement implements CheckoutRepo {
  final CheckoutRemoteDataSource checkoutRemoteDataSource;

  CheckoutRepoImplement({required this.checkoutRemoteDataSource});
  @override
  Future<Either<Failure, void>> addAddress(
      {required String token,
      required String name,
      required String country,
      required String city,
      required String address,
      required String phone}) async {
    try {
      var Address = await checkoutRemoteDataSource.addAddress(
          name: name,
          country: country,
          city: city,
          address: address,
          phone: phone);
      print('Add address successful');
      return right(Address);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addPayment({
    required String token,
    required String cardName,
    required String cardNumber,
    required String cvv,
    required String date,
  }) async {
    try {
      var payment = await checkoutRemoteDataSource.addPayment(
        cardName: cardName,
        cardNumber: cardNumber,
        date: date,
        cvv: cvv,
      );
      print('Add payment successful');
      return right(payment);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CardEntity>>> getPayment(
      {required String token}) async {
    try {
      var payment = await checkoutRemoteDataSource.getPayment();
      print('Get payment successful');
      return right(payment);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> orderConfirm({required String token}) async {
    try {
      var order = await checkoutRemoteDataSource.orderConfirm();
      print('order confirmed successfully');
      return right(order);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders(
      {required String token}) async {
    try {
      var orders = await checkoutRemoteDataSource.getOrders();
      print('orders $orders');
      return right(orders);
    } catch (e) {
      print('e');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
@override
  Future<Either<Failure, void>> deleteOrder(
      {required String token, required String orderId}) async {
    try {
      print('true');
      var order = await checkoutRemoteDataSource.deleteOrder(orderId: orderId);
      print('remove ordersuccessful');
      return right(order);
    } catch (e) {
      print('e');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
