import 'package:flutter/material.dart';
import 'products_list_view.dart';
import 'top_part.dart';

class AdidasViewBody extends StatelessWidget {
  const AdidasViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 60, right: 15, left: 15),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TopPart(
              title: 'Adidas',
            ),
          ),
          ProductsListView()
        ],
      ),
    );
  }
}
