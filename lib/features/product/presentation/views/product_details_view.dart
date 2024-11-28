import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/features/product/data/repos/product_repo_implement.dart';
import 'package:laza_app/features/product/domain/usecases/fetch_products_usecase.dart';
import 'package:laza_app/features/product/presentation/views/widgets/products_details_view_body.dart';

import '../../../../core/helper/service_locator.dart';
import '../../domain/usecases/fetch_product_details_usecase.dart';
import '../../domain/usecases/fetch_reviews_usecase.dart';
import '../manager/ProductsCubit/products_cubit.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;

    print(id);
    return BlocProvider(
      create: (context) => ProductsCubit(
          FetchProductsUseCase(productRepo: getIt<ProductRepoImplement>()),
          FetchProductDetailsUseCase(
              productRepo: getIt<ProductRepoImplement>()),
          FetchReviewsUsecase(productRepo: getIt<ProductRepoImplement>()))
        ..fetchProductDeatils(productId: id),
      child: const Scaffold(body: ProductsDetailsViewBody()),
    );
  }
}
