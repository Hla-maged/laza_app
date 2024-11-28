import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/core/helper/widgets/loading_indicator.dart';
import '../../manager/searchCubit/search_cubit.dart';
import 'product_card.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      if (state is SearchSuccess) {
        return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:
                  MediaQuery.of(context).size.width > 600 ? 0.7 : 0.5),
          delegate: SliverChildBuilderDelegate((context, index) {
            return ProductCard(
              id: state.products[index].productId,
              title: state.products[index].productName,
              image: state.products[index].productImage,
              price: state.products[index].productPrice,
            );
          }, childCount: state.products.length),
        );
      } else if (state is SearchFailure) {
        return SliverToBoxAdapter(child: (Text(state.error)));
      } else {
        return const SliverToBoxAdapter(child: CustomLoadingIndicator());
      }
    });
  }
}
