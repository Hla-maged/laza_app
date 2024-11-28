import 'package:dartz/dartz.dart';
import 'package:laza_app/features/checkout/domain/entities/card_entity.dart';
import '../../../../core/errors/failure.dart';
import '../entities/order_entity.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> addAddress({
    required String token,
    required String name,
    required String country,
    required String city,
    required String address,
    required String phone,
  });
  Future<Either<Failure, void>> addPayment({
    required String token,
    required String cardName,
    required String cardNumber,
    required String cvv,
    required String date,
  });
  Future<Either<Failure, List<CardEntity>>> getPayment({required String token});
  Future<Either<Failure, void>> orderConfirm({required String token});
  Future<Either<Failure, List<OrderEntity>>> getOrders({required String token});
  Future<Either<Failure, void>> deleteOrder({required String token,required String orderId});
}
