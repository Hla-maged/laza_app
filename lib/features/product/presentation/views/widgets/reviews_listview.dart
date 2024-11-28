import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/widgets/loading_indicator.dart';
import '../../manager/ProductsCubit/products_cubit.dart';
import 'review_card.dart';

class ReviewsListview extends StatelessWidget {
  const ReviewsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ReviewsSuccess) {
          print(state.reviews.length);
          return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.reviews.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ReviewCard(
                    name: state.reviews[index].name,
                    desc: state.reviews[index].feedback,
                    rate: state.reviews[index].rating,
                  ),
                );
              });
        } else if (state is ReviewsEmpty) {
          return const Center(child: Text('There is no reviews yet!'));
        } else if (state is ReviewsFailure) {
          return Text(state.error);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
