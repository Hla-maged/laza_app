import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'brand_option.dart';

class ChooseBrand extends StatelessWidget {
  const ChooseBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Choose Brand',
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'View All',
              style: TextStyle(color: Colors.grey, fontSize: 15.sp),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 50.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              BrandOption(
                name: 'Adidas',
                image: 'assets/images/Adidas.png',
                id: "1",
                navigate: 'adidas',
              ),
              BrandOption(
                name: 'Nike',
                image: 'assets/images/Vector.png',
                id: "2",
                navigate: 'nike',
              ),
              BrandOption(
                name: 'FILA',
                image: 'assets/images/fila-9 1.png',
                id: "3",
                navigate: 'fila',
              ),
              BrandOption(
                name: 'Puma',
                image: 'assets/images/puma-logo 1.png',
                id: "4",
                navigate: 'puma',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
