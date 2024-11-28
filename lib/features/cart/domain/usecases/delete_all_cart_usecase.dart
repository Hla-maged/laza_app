import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/failure.dart';
import '../repos/cart_repo.dart';

class DeleteAllCartUsecase extends UseCase<void, String> {
  final CartRepo cartRepo;

  DeleteAllCartUsecase({required this.cartRepo});
  @override
  Future<Either<Failure, void>> call() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return await cartRepo.deleteAllCart(token: token!);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call();
}
