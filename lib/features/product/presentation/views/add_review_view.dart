import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/features/product/data/repos/product_repo_implement.dart';
import 'package:laza_app/features/product/domain/usecases/add_review_usecase.dart';
import 'package:laza_app/features/product/domain/usecases/fetch_product_details_usecase.dart';
import 'package:laza_app/features/product/domain/usecases/fetch_products_usecase.dart';
import '../../../../core/helper/service_locator.dart';
import '../../domain/usecases/fetch_reviews_usecase.dart';
import '../manager/ProductsCubit/products_cubit.dart';
import 'widgets/add_review_view_body.dart';

class AddReviewView extends StatelessWidget {
  const AddReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(
          FetchProductsUseCase(productRepo: getIt<ProductRepoImplement>()),
          FetchProductDetailsUseCase(
              productRepo: getIt<ProductRepoImplement>()),
          FetchReviewsUsecase(productRepo: getIt<ProductRepoImplement>()),
          AddReviewUsecase(productRepo: getIt<ProductRepoImplement>())),
      child: const Scaffold(
        body: AddReviewViewBody(),
      ),
    );
  }
}
