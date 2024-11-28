import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget(
      {super.key,
      required this.text,
      required this.textColor,
      required this.backGColor,
      required this.onTap});
  final String text;
  final Color textColor, backGColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
          height: 0.08.sh,
          width: 0.35.sw,
          decoration: BoxDecoration(
              color: backGColor, borderRadius: BorderRadius.circular(10.r)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: 15.sp),
            ),
          )),
    );
  }
}
