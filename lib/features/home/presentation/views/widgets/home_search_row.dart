import 'package:flutter/material.dart';
import 'package:laza_app/constants.dart';

import 'custom_text_feild.dart';

class HomeSearchRow extends StatelessWidget {
  const HomeSearchRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'search');
          },
          child: const AbsorbPointer(
            child: CustomTextFeild(
              title: 'Search...',
              icon: Icons.search,
            ),
          ),
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
