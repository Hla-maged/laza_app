import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/features/home/presentation/views/widgets/products_list_view.dart';
import 'choose_brand.dart';
import 'home_search_row.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello',
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Welcome to Laza.',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20.h),
              const HomeSearchRow(),
              SizedBox(height: 30.h),
              const ChooseBrand(),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Arrival',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
        const ProductsListView(),
      ]),
    );
  }
}
