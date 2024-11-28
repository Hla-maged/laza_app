import 'package:flutter/material.dart';

class EmptyWishList extends StatelessWidget {
  const EmptyWishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          Image.asset(
            'assets/images/wish.jpg',
            height: 250,
            width: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          const Text(
            "Your wishlist is empty!",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
