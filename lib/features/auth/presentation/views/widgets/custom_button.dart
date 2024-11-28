import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        height: 70.h,
        width: double.infinity,
        decoration: const BoxDecoration(color: kPrimaryColor),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            textAlign: TextAlign.center,
            text,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.sp),
          ),
        ),
      ),
    );
  }
}
