import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/features/product/presentation/manager/ProductsCubit/products_cubit.dart';

class BrandOption extends StatelessWidget {
  const BrandOption(
      {super.key,
      required this.name,
      required this.image,
      required this.id,
      required this.navigate});
  final String name, image, id, navigate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: OutlinedButton(
        onPressed: () async {
          await BlocProvider.of<ProductsCubit>(context)
              .fetchProducts(categoryId: id);
          final productLength =
              (BlocProvider.of<ProductsCubit>(context).state as ProductsSuccess)
                  .products
                  .length;
          Navigator.pushNamed(context, navigate, arguments: productLength)
              .then((_) {
            BlocProvider.of<ProductsCubit>(context)
                .fetchProducts(categoryId: "");
          });
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 229, 230, 232),
          side: BorderSide(color: Colors.grey.shade300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.sp),
          ),
        ),
        child: Row(
          children: [
            Image.asset(image, width: 24.w, height: 24.h),
            SizedBox(width: 8.w),
            Text(
              name,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
