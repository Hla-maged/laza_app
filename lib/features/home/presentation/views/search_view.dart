import 'package:flutter/material.dart';
import 'package:laza_app/features/home/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SearchViewBody(),
      ),
    );
  }
}
