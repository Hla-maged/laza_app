import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/searchCubit/search_cubit.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.title,
    this.icon,
  });

  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextField(
        onChanged: (val) {
          BlocProvider.of<SearchCubit>(context).search(query: val);
        },
        decoration: InputDecoration(
          hintText: title,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: icon != null
              ? Icon(
                  icon,
                  color: Colors.grey,
                )
              : null,
          filled: true,
          fillColor: Colors.grey[70],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
