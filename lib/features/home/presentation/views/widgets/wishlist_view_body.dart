import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/features/home/presentation/views/widgets/wishlist_result.dart';
import '../../manager/WishlistCubit/wishlist_cubit.dart';
import 'custom_category_app_bar.dart';
import 'items_row.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
            child: Column(
          children: [
            const CustomCategoryAppBar(title: 'Wishlist'),
            SizedBox(
              height: 30.h,
            ),
            BlocBuilder<WishlistCubit, WishlistState>(
                builder: (context, state) {
              int itemCount = 0;
              if (state is FetchWishlistSuccess) {
                itemCount = state.wishlist.length;
              }
              return ItemsRow(
                text: '$itemCount Items',
                subText: 'in wishlist',
                action: 'Edit',
                icon: Icons.edit,
              );
            }),
            SizedBox(
              height: 20.h,
            ),
          ],
        )),
        const WishlistResult(),
      ]),
    );
  }
}
