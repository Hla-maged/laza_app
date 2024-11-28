import 'package:dartz/dartz.dart';
import 'package:laza_app/features/product/domain/entites/product_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/failure.dart';
import '../repos/product_repo.dart';

class FetchProductsUseCase extends UseCase<List<ProductEntity>, String> {
  final ProductRepo productRepo;

  FetchProductsUseCase({required this.productRepo});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(String categoryId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return await productRepo.getProducts(token: token!, categoryId: categoryId);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
