import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/failure.dart';
import '../repos/checkout_repo.dart';

class AddAddressUsecase extends UseCase<void, AddAddressParams> {
  final CheckoutRepo checkoutRepo;

  AddAddressUsecase({required this.checkoutRepo});
  @override
  Future<Either<Failure, void>> call(AddAddressParams params) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return await checkoutRepo.addAddress(
        token: token!,
        name: params.name,
        country: params.country,
        city: params.city,
        address: params.address,
        phone: params.phone);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params param);
}

class AddAddressParams {
  final String address, name, country, city, phone;

  AddAddressParams({
    required this.address,
    required this.name,
    required this.city,
    required this.phone,
    required this.country,
  });
}
