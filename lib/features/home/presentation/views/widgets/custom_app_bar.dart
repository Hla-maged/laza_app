import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () => Navigator.pop(context, true),
            child: const Icon(
              Icons.arrow_back,
              size: 26,
            )),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        )
      ],
    );
  }
}
