import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/failure.dart';
import '../repos/checkout_repo.dart';

class OrderConfirmUsecase extends UseCase<void, String> {
  final CheckoutRepo checkoutRepo;

  OrderConfirmUsecase({required this.checkoutRepo});
  @override
  Future<Either<Failure, void>> call() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return await checkoutRepo.orderConfirm(token: token!);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call();
}
