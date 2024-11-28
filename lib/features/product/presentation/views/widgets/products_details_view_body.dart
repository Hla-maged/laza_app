import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helper/widgets/loading_indicator.dart';
import '../../../../auth/presentation/views/widgets/custom_button.dart';
import '../../../../cart/presentation/manager/CartCubit/cart_cubit.dart';
import '../../manager/ProductsCubit/products_cubit.dart';
import 'review_card.dart';
import 'sizes_row.dart';

class ProductsDetailsViewBody extends StatelessWidget {
  const ProductsDetailsViewBody({super.key});
  final String baseUrl = 'https://laza.runasp.net/';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          final product = state.product;
          final firstReview =
              product.reviews?.isNotEmpty == true ? product.reviews![0] : null;

          return SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 300.h,
                      child:
                      //  Image.network(
                      //   "$baseUrl${product.productImage}",
                      //   fit: BoxFit.cover,
                      // ),
                      CachedNetworkImage(
                      imageUrl: '$baseUrl${product.productImage}',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.grey,
                      )),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )
                    ),
                    Positioned(
                      top: 20,
                      left: 10,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 20,
                      right: 10,
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.productName,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${product.productPrice}EGP",
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                            width: 75,
                            height: 90,
                            "$baseUrl${product.images![0].image}",
                          ),
                          Image.network(
                            "$baseUrl${product.images![1].image}",
                            width: 75,
                            height: 90,
                          ),
                          Image.network(
                            "$baseUrl${product.images![2].image}",
                            width: 75,
                            height: 90,
                          ),
                          Image.network(
                            "$baseUrl${product.images![3].image}",
                            width: 75,
                            height: 90,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const SizesRow(),
                      const SizedBox(height: 16),
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        product.productDesc!,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Reviews',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'review',
                                      arguments: product.productId)
                                  .then((result) {
                                if (result == true) {
                                  BlocProvider.of<ProductsCubit>(context)
                                      .fetchProductDeatils(
                                          productId: product.productId);
                                }
                              });
                            },
                            child: const Text(
                              'View All',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      if (firstReview != null)
                        ReviewCard(
                          name: firstReview.name,
                          desc: firstReview.feedback,
                          rate: firstReview.rating,
                        )
                      else
                        const Center(
                          child: Text(
                            "No reviews available!",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                  style: TextStyle(fontSize: 18),
                                  children: [
                                    TextSpan(
                                        text: 'Total Price\n',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.grey,
                                        )),
                                    TextSpan(
                                        text: 'with VAT, SD',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14))
                                  ])),
                          Text(
                            '${product.productPrice} EGP',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: 'Add to cart',
                  onTap: () async {
                    BlocProvider.of<CartCubit>(context)
                        .addCart(productId: product.productId);

                    Navigator.pushNamed(context, 'cart',
                            arguments: product.productId)
                        .then((_) {
                      BlocProvider.of<CartCubit>(context).fetchCart();
                    });
                  },
                )
              ],
            ),
          ));
        } else if (state is ProductsFailure) {
          return (Text(state.error));
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
