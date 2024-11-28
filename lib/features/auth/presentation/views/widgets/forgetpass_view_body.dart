import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/features/auth/presentation/manager/ForgetPassCubit/forgetPass_cubit.dart';
import '../../../../../core/helper/widgets/loading_indicator.dart';
import 'custom_button.dart';
import 'custom_text_feild.dart';
import 'custom_title.dart';

class ForgetpassViewBody extends StatefulWidget {
  const ForgetpassViewBody({super.key});

  @override
  State<ForgetpassViewBody> createState() => _ForgetpassViewBodyState();
}

class _ForgetpassViewBodyState extends State<ForgetpassViewBody> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  String? email;
  bool errorMessage = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPassCubit, ForgetPassState>(
        listener: (context, state) {
      if (state is ForgetPassSuccess) {
        Navigator.pushNamed(context, 'verify', arguments: email);
      }
    }, builder: (context, state) {
      if (state is ForgetPassLoading) {
        return const CustomLoadingIndicator();
      }
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomTitle(text: 'Forgot Password'),
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
              Form(
                key: key,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: CustomTextField(
                    obsecure: false,
                    label: 'Email Address',
                    onSaved: (val) {
                      email = val;
                    },
                    onChanged: (val) {
                      setState(() {
                        errorMessage = false;
                      });
                    },
                    validator: (val) {
                      if (val == null || !val.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 115.h,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                    child: Text(
                  textAlign: TextAlign.center,
                  'Please write your email to receive a\n confirmation code to set a new password.',
                  style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                )),
              ),
              CustomButton(
                  text: 'Confirm Mail',
                  onTap: () {
                    if (key.currentState!.validate()) {
                      key.currentState!.save();

                      BlocProvider.of<ForgetPassCubit>(context)
                          .forgetPass(email: email!);
                      print('forget');
                    }
                  })
            ],
          ),
        ),
      );
    });
  }
}
