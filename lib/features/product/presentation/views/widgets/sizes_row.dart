import 'package:flutter/material.dart';

import 'size_chipes.dart';

class SizesRow extends StatelessWidget {
  const SizesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              'Size',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 220,
            ),
            Text(
              'Size Guide',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizeSelection()
      ],
    );
  }
}
