import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryAppBar extends StatelessWidget {
  const CustomCategoryAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back)),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
        ),
        const Icon(Icons.shopping_bag_outlined),
      ],
    );
  }
}
