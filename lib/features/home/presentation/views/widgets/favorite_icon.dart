import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/WishlistCubit/wishlist_cubit.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon(
      {super.key, required this.title, required this.image, required this.id, required this.price});

  final String title, image, id;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 4,
      right: -1,
      child:
          BlocBuilder<WishlistCubit, WishlistState>(builder: (context, state) {
        bool wished = false;

        if (state is FetchWishlistSuccess) {
          wished = state.wishlist.any((product) => product.productId == id);
        }

        return IconButton(
          icon: Icon(
            wished ? Icons.favorite : Icons.favorite_border,
            color: wished ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            if (wished) {
              BlocProvider.of<WishlistCubit>(context).deleteWishlist(
                  productId: id, image: image, name: title, price: price);
            } else {
              BlocProvider.of<WishlistCubit>(context).addWishlist(
                  productId: id, image: image, name: title, price: price);
            }
          },
        );
      }),
    );
  }
}
