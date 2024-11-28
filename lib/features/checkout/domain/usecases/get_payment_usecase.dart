import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/failure.dart';
import '../entities/card_entity.dart';
import '../repos/checkout_repo.dart';

class GetPaymentUseCase extends UseCase<List<CardEntity>, String> {
  final CheckoutRepo checkoutRepo;

  GetPaymentUseCase({required this.checkoutRepo});

  @override
  Future<Either<Failure, List<CardEntity>>> call() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return await checkoutRepo.getPayment(token: token!);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call();
}
