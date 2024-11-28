import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/features/product/presentation/manager/ProductsCubit/products_cubit.dart';
import 'package:laza_app/features/product/presentation/views/widgets/review_view.body.dart';

import '../../../../core/helper/service_locator.dart';
import '../../data/repos/product_repo_implement.dart';
import '../../domain/usecases/fetch_product_details_usecase.dart';
import '../../domain/usecases/fetch_products_usecase.dart';
import '../../domain/usecases/fetch_reviews_usecase.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    return BlocProvider(
      create: (context) => ProductsCubit(
        FetchProductsUseCase(productRepo: getIt<ProductRepoImplement>()),
        FetchProductDetailsUseCase(productRepo: getIt<ProductRepoImplement>()),
        FetchReviewsUsecase(productRepo: getIt<ProductRepoImplement>()),
      )..fetchReviews(productId: id),
      child: const Scaffold(
        body: ReviewViewbody(),
      ),
    );
  }
}
