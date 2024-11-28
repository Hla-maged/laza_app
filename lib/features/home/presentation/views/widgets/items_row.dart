import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemsRow extends StatelessWidget {
  const ItemsRow(
      {super.key,
      required this.text,
      required this.subText,
      required this.action,
      required this.icon});
  final String text, subText, action;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
          ),
          Text(
            subText,
            style: TextStyle(color: Colors.grey, fontSize: 13.sp),
          )
        ],
      ),
      Container(
          width: 70.w,
          height: 30.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              Text(
                action,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
              )
            ],
          ))
    ]);
  }
}
