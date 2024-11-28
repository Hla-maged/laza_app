import 'package:flutter/material.dart';

import 'cart_items.dart';
import 'custom_category_app_bar.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(top: 60, left: 10, right: 10),
        child: Column(
          children: [
            CustomCategoryAppBar(title: 'Cart'),
            SizedBox(
              height: 20,
            ),
            CartItems(),
          ],
        ));
  }
}
