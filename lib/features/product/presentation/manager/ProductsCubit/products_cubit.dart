import 'package:bloc/bloc.dart';
import 'package:laza_app/features/product/domain/entites/product_entity.dart';
import 'package:laza_app/features/product/domain/usecases/fetch_product_details_usecase.dart';
import 'package:laza_app/features/product/domain/usecases/fetch_reviews_usecase.dart';
import 'package:meta/meta.dart';
import '../../../domain/entites/review_entity.dart';
import '../../../domain/usecases/add_review_usecase.dart';
import '../../../domain/usecases/fetch_products_usecase.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit([
    this.fetchProductsUseCase,
    this.fetchProductDetailsUseCase,
    this.fetchReviewsUsecase,
    this.addReviewUsecase,
  ]) : super(ProductsLoading());
  final FetchProductsUseCase? fetchProductsUseCase;
  final FetchProductDetailsUseCase? fetchProductDetailsUseCase;
  final FetchReviewsUsecase? fetchReviewsUsecase;
  final AddReviewUsecase? addReviewUsecase;

  Future<void> fetchProducts({required String categoryId}) async {
    var result = await fetchProductsUseCase!.call(categoryId);
    result.fold((failure) {
      emit(ProductsFailure(failure.errMessage));
    }, (products) {
      emit(ProductsSuccess(products));
    });
  }

  Future<void> fetchProductDeatils({required String productId}) async {
    print(productId);
    var result = await fetchProductDetailsUseCase!.call(productId);
    result.fold((failure) {
      emit(ProductsFailure(failure.errMessage));
    }, (product) {
      emit(ProductSuccess(product));
    });
  }

  Future<void> fetchReviews({required String productId}) async {
    if (fetchReviewsUsecase == null) {
      emit(ReviewsFailure("FetchReviewsUsecase not initialized"));
      return;
    }
    var result = await fetchReviewsUsecase!.call(productId);
    result.fold((failure) {
      print('fetch reviews fails');
      emit(ReviewsFailure(failure.errMessage));
    }, (reviews) {
      if (reviews.isEmpty) {
        emit(ReviewsEmpty());
      } else {
        emit(ReviewsSuccess(reviews));
      }
    });
  }

  Future<void> addReview(
      {required String productId,
      required String name,
      required String feedback,
      required double rate}) async {
    print('add review cubit');
    var result = await addReviewUsecase!.call(
      AddReviewParams(
          productId: productId, name: name, feedback: feedback, rate: rate),
    );
    print('result $result');
    result.fold((failure) {
      print('failure state ${failure.errMessage}');
      emit(AddReviewFailure(failure.errMessage));
    }, (_) {
      emit(AddReviewSuccess());
      print('success state');
      fetchReviews(productId: productId);
    });
  }
}
