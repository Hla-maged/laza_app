import 'package:dartz/dartz.dart';
import 'package:laza_app/features/product/domain/entites/product_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/failure.dart';
import '../repos/product_repo.dart';

class FetchWishlistUseCase extends UseCase<List<ProductEntity>, String> {
  final ProductRepo productRepo;

  FetchWishlistUseCase({required this.productRepo});

  @override
  Future<Either<Failure, List<ProductEntity>>> call() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return await productRepo.getWishlist(
      token: token!,
    );
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call();
}
