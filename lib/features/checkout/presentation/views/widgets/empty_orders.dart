import 'package:flutter/material.dart';

class EmptyOrders extends StatelessWidget {
  const EmptyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/order (2).jpg',
          height: 300,
          width: 250,
          fit: BoxFit.contain,
        ),
      const  Text(
          'Go make your first order now!',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        const SizedBox(
          height: 70,
        ),
      ],
    );
  }
}
