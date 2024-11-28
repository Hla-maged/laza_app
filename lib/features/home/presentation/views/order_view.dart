import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/order2.png'),
          Text(
            'There is no orders now!',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),
          ),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
