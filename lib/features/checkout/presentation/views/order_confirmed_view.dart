import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/presentation/views/widgets/custom_button.dart';
import '../manager/OrderCubit/order_cubit.dart';

class OrderConfirmedView extends StatelessWidget {
  const OrderConfirmedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFCFC),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back)),
              ],
            ),
            const SizedBox(
              height: 47,
            ),
            Image.asset('assets/images/Screenshot 2024-10-03 175338.png'),
            const Text(
              'Order Confirmed!',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
            ),
            const Text(
              'Your order has been confirmed, we will send \n           you confirmation email shortly.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 180,
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 50,
                width: 320,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(14)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'order').then((_) {
                      BlocProvider.of<OrderCubit>(context).fetchOrders();
                    });
                  },
                  child: const Center(
                    child: Text(
                      'Go to Orders',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
                text: 'Continue Shopping',
                onTap: () {
                  Navigator.pushNamed(context, 'parent');
                })
          ],
        ),
      ),
    );
  }
}
