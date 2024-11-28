import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/failure.dart';
import '../repos/checkout_repo.dart';

class AddPaymentUsecase extends UseCase<void, AddPaymentParams> {
  final CheckoutRepo checkoutRepo;

  AddPaymentUsecase({required this.checkoutRepo});
  @override
  Future<Either<Failure, void>> call(AddPaymentParams params) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return await checkoutRepo.addPayment(
      token: token!,
      cardName: params.cardName,
      cardNumber: params.cardNumber,
      cvv: params.cvv,
      date: params.date,
    );
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params param);
}

class AddPaymentParams {
  final String cardName, cardNumber, cvv, date;

  AddPaymentParams({
    required this.cardName,
    required this.cvv,
    required this.cardNumber,
    required this.date,
  });
}
