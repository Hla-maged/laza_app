part of 'wishlist_cubit.dart';

sealed class WishlistState {}

//for fetch wishlist

final class FetchWishlistInitial extends WishlistState {}

final class FetchWishlistLoading extends WishlistState {}

final class EmptyWishlist extends WishlistState {}

final class FetchWishlistSuccess extends WishlistState {
  final List<ProductEntity> wishlist;

  FetchWishlistSuccess(this.wishlist);
}

final class FetchWishlistFailure extends WishlistState {
  final String error;
  FetchWishlistFailure(this.error);
}

// for add wishlist

final class AddWishlistSuccess extends WishlistState {}

final class AddWishlistFailure extends WishlistState {
  final String error;
  AddWishlistFailure(this.error);
}

// for delete wishlist

final class DeleteWishlistSuccess extends WishlistState {}

final class DeleteWishlistFailure extends WishlistState {
  final String error;
  DeleteWishlistFailure(this.error);
}
