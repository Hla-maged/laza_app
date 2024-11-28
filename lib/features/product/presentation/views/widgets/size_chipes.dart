import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class SizeSelection extends StatefulWidget {
  @override
  _SizeSelectionState createState() => _SizeSelectionState();
}

class _SizeSelectionState extends State<SizeSelection> {
  String selectedSize = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: ['S', 'M', 'L', 'XL', '2XL'].map((size) {
        final bool isSelected = size == selectedSize;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedSize = size;
            });
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: isSelected ? kPrimaryColor : Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                size,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                 
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
