import 'package:flutter/material.dart';
import 'package:laza_app/features/home/presentation/views/widgets/wishlist_view_body.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: WishlistViewBody(),
    );
  }
}






