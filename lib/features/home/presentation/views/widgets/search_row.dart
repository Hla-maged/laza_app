import 'package:flutter/material.dart';
import 'package:laza_app/constants.dart';

import 'custom_text_feild.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: CustomTextFeild(
          title: 'Search...',
          icon: Icons.search,
        )),
        const SizedBox(width: 10),
        Container(
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.mic),
            color: Colors.white,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
