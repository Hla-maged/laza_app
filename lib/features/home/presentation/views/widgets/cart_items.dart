import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/widgets/loading_indicator.dart';
import '../../../../cart/domain/entities/cart_item_entity.dart';
import '../../../../cart/presentation/manager/CartCubit/cart_cubit.dart';
import '../../../../cart/presentation/views/widgets/cart_item.dart';
import '../../../../cart/presentation/views/widgets/empty_cart.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const CustomLoadingIndicator();
            } else if (state is CartSuccess) {
              final cart = state.cart;
              print(cart);
              return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final CartItemEntity item = cart.items[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: CartItem(
                        productId: item.id,
                        name: item.name,
                        image: item.img,
                        price: item.price,
                      ),
                    );
                  },
                ),
              );
            } else if (state is CartEmpty) {
              return const EmptyCart();
            } else if (state is CartInitial) {
              print(state);
              return const Text('initial');
            } else {
              return const Center(
                child: Text('Error'),
              );
            }
          },
        ),
      ),
    );
  }
}
