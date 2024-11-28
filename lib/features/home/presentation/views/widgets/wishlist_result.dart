import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/features/home/presentation/manager/WishlistCubit/wishlist_cubit.dart';

import '../../../../../core/helper/widgets/loading_indicator.dart';
import 'empty_wishlist.dart';
import 'product_card.dart';

class WishlistResult extends StatelessWidget {
  const WishlistResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(builder: (context, state) {
      if (state is FetchWishlistSuccess) {
        return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:
                  MediaQuery.of(context).size.width > 600 ? 0.7 : 0.5),
          delegate: SliverChildBuilderDelegate((context, index) {
            return ProductCard(
              id: state.wishlist[index].productId,
              title: state.wishlist[index].productName,
              image: state.wishlist[index].productImage,
              price: state.wishlist[index].productPrice,
            );
          }, childCount: state.wishlist.length),
        );
      } else if (state is FetchWishlistFailure) {
        return SliverToBoxAdapter(child: (Text(state.error)));
      } else if (state is EmptyWishlist) {
        return const SliverToBoxAdapter(child: EmptyWishList());
      } else {
        return const SliverToBoxAdapter(child: CustomLoadingIndicator());
      }
    });
  }
}
