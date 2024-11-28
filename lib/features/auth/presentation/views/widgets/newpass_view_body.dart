import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/core/helper/widgets/loading_indicator.dart';
import 'package:laza_app/features/auth/presentation/manager/UpdatePassCubit/updatePass_cubit.dart';

import '../../../../../core/helper/widgets/custom_error.dart';
import 'custom_button.dart';
import 'custom_text_feild.dart';
import 'custom_title.dart';

class NewpassViewBody extends StatefulWidget {
  const NewpassViewBody({super.key});

  @override
  State<NewpassViewBody> createState() => _NewpassViewBodyState();
}

class _NewpassViewBodyState extends State<NewpassViewBody> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;
  String? pass, confirmPass;
  bool errorMessage = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdatepassCubit, UpdatePassState>(
      listener: (context, state) {
        if (state is UpdatePassSuccess) {
          Navigator.pushNamed(context, 'signIn');
        } else if (state is UpdatePassFailure) {
          CustomError.errorMessage(context, state);
        }
      },
      builder: (context, state) {
        if (state is UpdatePassLoading) {
          return const CustomLoadingIndicator();
        }
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomTitle(
                  text: 'New Password',
                ),
                SizedBox(
                  height: 140.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Form(
                    key: key,
                    child: Column(
                      children: [
                        CustomTextField(
                          obsecure: true,
                          controller: password,
                          label: 'Password',
                          onSaved: (val) {
                            pass = val;
                          },
                          onChanged: (val) {
                            setState(() {});
                          },
                          validator: (val) {
                            if (val == null || val.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          obsecure: true,
                          controller: confirmPassword,
                          label: 'Confirm Password',
                          onSaved: (val) {
                            confirmPass = val;
                          },
                          onChanged: (val) {
                            setState(() {});
                          },
                          validator: (val) {
                            if (val == null || val != password.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 180.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(21),
                  child: Center(
                    child: Text(
                      'Please write your new password.',
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                  ),
                ),
                CustomButton(
                  text: 'Reset Password',
                  onTap: () {
                    if (key.currentState!.validate()) {
                      key.currentState!.save();
                      final email =
                          ModalRoute.of(context)?.settings.arguments as String;
                      BlocProvider.of<UpdatepassCubit>(context).updatePass(
                          pass: pass!, confirmPass: confirmPass!, email: email);
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
