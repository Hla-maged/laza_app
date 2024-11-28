import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laza_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'search_result.dart';
import 'search_row.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: CustomAppBar(
                title: 'Search Page',
              ),
            ),
            SearchRow(),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
        SearchResult(),
      ],
    );
  }
}
