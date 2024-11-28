import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_category_app_bar.dart';
import 'items_row.dart';

class TopPart extends StatelessWidget {
  const TopPart({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final productLength = ModalRoute.of(context)?.settings.arguments as int;

    return Column(
      children: [
        CustomCategoryAppBar(
          title: title,
        ),
        SizedBox(
          height: 30.h,
        ),
        ItemsRow(
          text: '$productLength Items',
          subText: 'Available in stock',
          action: 'Sort',
          icon: Icons.sort,
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
