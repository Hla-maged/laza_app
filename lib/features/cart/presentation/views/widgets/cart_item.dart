import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/features/cart/presentation/manager/CartCubit/cart_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {super.key,
      required this.image,
      required this.name,
      required this.price,
      required this.productId});
  final String image, name, productId;
  final double price;

  final String baseUrl = 'https://laza.runasp.net/';

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network('$baseUrl$image',
            width: 100, height: 100, fit: BoxFit.contain),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('$price', style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.keyboard_arrow_down),
                        onPressed: () {},
                      ),
                      const Text(
                        '1',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      IconButton(
                        icon: const Icon(Icons.keyboard_arrow_up),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outlined),
                    onPressed: () {
                      BlocProvider.of<CartCubit>(context)
                          .deleteCart(productId: productId);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
