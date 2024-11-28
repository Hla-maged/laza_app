part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

//for products
final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<ProductEntity> products;

  ProductsSuccess(this.products);
}

final class ProductsFailure extends ProductsState {
  final String error;
  ProductsFailure(this.error);
}

// for product details
final class ProductSuccess extends ProductsState {
  final ProductEntity product;

  ProductSuccess(this.product);
}

// for reviews
final class ReviewsSuccess extends ProductsState {
  final List<ReviewEntity> reviews;

  ReviewsSuccess(this.reviews);
}

final class ReviewsFailure extends ProductsState {
  final String error;
  ReviewsFailure(this.error);
}

final class ReviewsEmpty extends ProductsState {}

//for add review

final class AddReviewSuccess extends ProductsState {}

final class AddReviewFailure extends ProductsState {
  final String error;
  AddReviewFailure(this.error);
}
