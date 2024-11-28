import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../repos/product_repo.dart';

class AddReviewUsecase extends UseCase<void, AddReviewParams> {
  final ProductRepo productRepo;

  AddReviewUsecase({required this.productRepo});
  @override
  Future<Either<Failure, void>> call(AddReviewParams addParams) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    return await productRepo.addReview(
      token: token!,
      productId: addParams.productId,
      name: addParams.name,
      feedback: addParams.feedback,
      rate: addParams.rate,
    );
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class AddReviewParams {
  final String productId, name, feedback;
  final double rate;

  AddReviewParams({
    required this.productId,
    required this.name,
    required this.feedback,
    required this.rate,
  });
}
