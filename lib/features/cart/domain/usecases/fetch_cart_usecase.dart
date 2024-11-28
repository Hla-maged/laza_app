import 'package:dartz/dartz.dart';
import 'package:laza_app/features/cart/domain/entities/cart_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/failure.dart';
import '../repos/cart_repo.dart';

class FetchCartUsecase extends UseCase<CartEntity, String> {
  final CartRepo cartRepo;

  FetchCartUsecase({required this.cartRepo});
  @override
  Future<Either<Failure, CartEntity>> call() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    return await cartRepo.getCart(token: token!);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call();
}
