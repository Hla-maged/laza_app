import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxNumbers extends StatelessWidget {
  const BoxNumbers(
      {super.key,
      required this.controller1,
      required this.controller2,
      required this.controller3,
      required this.controller4});

  final TextEditingController controller1;
  final TextEditingController controller2;
  final TextEditingController controller3;
  final TextEditingController controller4;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildBoxNumber(controller1),
        buildBoxNumber(controller2),
        buildBoxNumber(controller3),
        buildBoxNumber(controller4),
      ],
    );
  }

  Widget buildBoxNumber(TextEditingController controller) {
    return Container(
      width: 70.w,
      height: 80.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22.sp),
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
