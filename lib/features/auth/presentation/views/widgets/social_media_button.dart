import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaButton extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;

  const SocialMediaButton({
    super.key,
    required this.color,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(14)),
        height: 50.h,
        width: 300.w,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            icon,
            color: Colors.white,
            size: 22,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ]),
      ),
    );
  }
}
