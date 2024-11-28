import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.validator,
      this.onSaved,
      this.onChanged,
      this.controller,
      required this.label,
      this.obsecure,
      this.icon});
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String label;
  final bool? obsecure;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: obsecure!,
              controller: controller,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: onSaved,
              onChanged: onChanged,
              validator: validator,
              decoration: InputDecoration(
                labelText: label,
                labelStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        Icon(
          icon,
          color: const Color(0xff34C559),
          size: 20,
        )
      ],
    );
  }
}
