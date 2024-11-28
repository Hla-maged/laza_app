import 'package:flutter/material.dart';

class SwitchW extends StatelessWidget {
  const SwitchW(
      {super.key,
      required this.title,
      required this.remember,
      required this.onChanged});
  final String title;
  final bool remember;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
          ),
          const Spacer(),
          Switch(
            activeColor: Colors.white,
            activeTrackColor: const Color(0xff34C759),
            value: remember,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
