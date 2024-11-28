import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/core/helper/widgets/custom_error.dart';
import 'package:laza_app/core/helper/widgets/loading_indicator.dart';
import 'package:laza_app/features/auth/presentation/manager/VerifyCodeCubit/verifycode_cubit.dart';
import 'package:laza_app/features/auth/presentation/manager/VerifyCodeCubit/verifycode_states.dart';
import 'box_numbers.dart';
import 'custom_button.dart';
import 'custom_title.dart';

class VerficationViewBody extends StatefulWidget {
  const VerficationViewBody({super.key});

  @override
  State<VerficationViewBody> createState() => _VerficationViewBodyState();
}

class _VerficationViewBodyState extends State<VerficationViewBody> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifycodeCubit, VerifyCodeState>(
        listener: (context, state) {
      if (state is VerifyCodeSuccess) {
        final email = ModalRoute.of(context)?.settings.arguments as String;
        Navigator.pushNamed(context, 'newPass', arguments: email);
      } else if (state is VerifyCodeFailure) {
        CustomError.errorMessage(context, state);
      }
    }, builder: (context, state) {
      if (state is VerifyCodeLoading) {
        return const CustomLoadingIndicator();
      }
      return SafeArea(
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              const CustomTitle(text: 'Verification Code'),
              SizedBox(
                height: 40.h,
              ),
              SizedBox(
                  height: 0.28.sh,
                  child: Image.asset(
                    'assets/images/Object.png',
                    fit: BoxFit.contain,
                  )),
              SizedBox(
                height: 40.h,
              ),
              BoxNumbers(
                controller1: controller1,
                controller2: controller2,
                controller3: controller3,
                controller4: controller4,
              ),
              SizedBox(height: 130.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "00:20",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "resend confirmation code.",
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                text: 'Confirm Code',
                onTap: () {
                  final code = controller1.text +
                      controller2.text +
                      controller3.text +
                      controller4.text;
                  final email =
                      ModalRoute.of(context)?.settings.arguments as String;
                  BlocProvider.of<VerifycodeCubit>(context)
                      .verify(code: code, email: email);
                },
              )
            ])),
      );
    });
  }
}
