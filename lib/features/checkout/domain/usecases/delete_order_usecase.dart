import 'package:dartz/dartz.dart';
import 'package:laza_app/features/checkout/domain/repos/checkout_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/failure.dart';

class DeleteOrderUsecase extends UseCase<void, String> {
  final CheckoutRepo checkoutRepo;

  DeleteOrderUsecase({required this.checkoutRepo});
  @override
  Future<Either<Failure, void>> call(String orderId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return await checkoutRepo.deleteOrder(token: token!, orderId: orderId);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params param);
}
