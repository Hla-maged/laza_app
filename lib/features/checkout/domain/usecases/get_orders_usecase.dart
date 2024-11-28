import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/failure.dart';
import '../entities/order_entity.dart';
import '../repos/checkout_repo.dart';


class FetchOrderUsecase extends UseCase<List<OrderEntity>, String> {
  final CheckoutRepo checkoutRepo;

  FetchOrderUsecase({required this.checkoutRepo});
  @override
  Future<Either<Failure, List<OrderEntity>>> call() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    return await checkoutRepo.getOrders(token: token!);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call();
}
