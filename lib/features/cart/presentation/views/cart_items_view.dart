import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/features/auth/presentation/views/widgets/custom_button.dart';
import '../../../../core/helper/widgets/loading_indicator.dart';
import '../../../checkout/presentation/manager/OrderCubit/order_cubit.dart';
import '../../../home/presentation/views/widgets/custom_app_bar.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../manager/CartCubit/cart_cubit.dart';
import 'widgets/cart_item.dart';
import 'widgets/empty_cart.dart';
import 'widgets/info_item.dart';
import 'widgets/order_info.dart';

class CartItemsView extends StatefulWidget {
  const CartItemsView({super.key});

  @override
  State<CartItemsView> createState() => _CartItemsViewState();
}

class _CartItemsViewState extends State<CartItemsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CartCubit>(context).fetchCart();
  }

  @override
  Widget build(BuildContext context) {
    double subTotal = 0.0;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            const CustomAppBar(
              title: 'Cart',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is CartLoading) {
                      return const CustomLoadingIndicator();
                    } else if (state is CartSuccess) {
                      final cart = state.cart;
                      subTotal = cart.totalPrice;

                      return ListView(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: cart.items.length,
                              itemBuilder: (context, index) {
                                final CartItemEntity item = cart.items[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: CartItem(
                                    productId: item.id,
                                    name: item.name,
                                    image: item.img,
                                    price: item.price,
                                  ),
                                );
                              },
                            ),
                          ),
                          const InfoItem(
                            title: 'Delivery Address',
                            info: 'Egypt,Damietta street 101',
                            sub: 'Damietta',
                            image:
                                'assets/images/Screenshot 2024-10-03 170727.png',
                            navigate: 'address',
                          ),
                          const InfoItem(
                            title: 'Payment Method',
                            info: 'Visa Classic',
                            sub: '**** 7644',
                            image:
                                'assets/images/Screenshot 2024-10-03 170906.png',
                            navigate: 'addNewCard',
                          ),
                          OrderInfo(
                            subTotal: subTotal,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    } else if (state is CartEmpty) {
                      return const EmptyCart();
                    }  else {
                      return const Center(
                        child: Text('Error'),
                      );
                    }
                  },
                ),
              ),
            ),
            CustomButton(
              text: 'Checkout',
              onTap: (){
                Navigator.pushNamed(context, 'checkout');

                BlocProvider.of<OrderCubit>(context).orderConfirm();
                BlocProvider.of<CartCubit>(context).deleteAllCart();
               
              },
            ),
          ],
        ),
      ),
    );
  }
}
