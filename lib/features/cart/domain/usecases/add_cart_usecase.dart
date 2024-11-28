import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/failure.dart';
import '../repos/cart_repo.dart';

class AddCartUsecase extends UseCase<void, String> {
  final CartRepo cartRepo;

  AddCartUsecase({required this.cartRepo});
  @override
  Future<Either<Failure, void>> call(String productId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return await cartRepo.addCart(productId: productId, token: token!);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params param);
}
