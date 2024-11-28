import 'package:flutter/material.dart';
import 'package:laza_app/features/checkout/presentation/views/widgets/order_view_body.dart';


class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrderViewBody(),
    );
  }
}
