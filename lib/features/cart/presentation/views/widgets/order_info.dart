import 'package:flutter/material.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({super.key, required this.subTotal});
  final double subTotal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Order Info',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        OrderInfoRow(title: 'Subtotal', price: '$subTotal EGP'),
        const OrderInfoRow(title: 'Shipping cost', price: '60.0 EGP'),
        OrderInfoRow(title: 'Total', price: '${subTotal + 60} EGP'),
      ],
    );
  }
}

class OrderInfoRow extends StatelessWidget {
  const OrderInfoRow({super.key, required this.title, required this.price});
  final String title, price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey)),
        Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
