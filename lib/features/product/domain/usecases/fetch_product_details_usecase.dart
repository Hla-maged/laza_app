import 'package:dartz/dartz.dart';
import 'package:laza_app/features/product/domain/entites/product_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/failure.dart';
import '../repos/product_repo.dart';

class FetchProductDetailsUseCase extends UseCase<ProductEntity, String> {
  final ProductRepo productRepo;

  FetchProductDetailsUseCase({required this.productRepo});

  @override
  Future<Either<Failure, ProductEntity>> call(String productId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    print('token$token');
    return await productRepo.getProductDetails(
        productId: productId, token: token!);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
