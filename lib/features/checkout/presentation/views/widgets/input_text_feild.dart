import 'package:flutter/material.dart';

class InputTextFeild extends StatelessWidget {
  const InputTextFeild(
      {super.key, required this.title, this.onSaved, this.validator});

  final String title;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onSaved: onSaved,
        validator: (val) {
          if (val?.isEmpty ?? true) {
            return "This Field is required";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: title,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
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
