import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/failure.dart';
import 'package:laza_app/features/product/domain/entites/review_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repos/product_repo.dart';

class FetchReviewsUsecase extends UseCase<List<ReviewEntity>, String> {
  final ProductRepo productRepo;

  FetchReviewsUsecase({required this.productRepo});
  @override
  Future<Either<Failure, List<ReviewEntity>>> call(String productId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    return await productRepo.getReviews(token: token!, productId: productId);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
