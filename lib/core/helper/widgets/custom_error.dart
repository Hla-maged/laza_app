import 'package:flutter/material.dart';

class CustomError {
  static void errorMessage(BuildContext context, state) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(state.error)),
    );
  }
}
