import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/core/helper/widgets/custom_error.dart';
import '../../../../../core/helper/widgets/loading_indicator.dart';
import '../../manager/RegisterCubit/register_cubit.dart';
import '../sign_in_view.dart';
import 'custom_button.dart';
import 'custom_text_feild.dart';
import 'custom_title.dart';
import 'switch.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key, required this.toggleTheme});
  final VoidCallback toggleTheme;

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  String? email, password, user;
  bool errorMessage = false, remember = false;

  bool updateRemember(bool val) {
    setState(() {
      remember = val;
    });

    return remember;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
      if (state is RegisterSuccess) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SignInView(
              toggleTheme: widget.toggleTheme,
              user: user!,
              email: email!,
            ),
          ),
        );
      } else if (state is RegisterFailure) {
        CustomError.errorMessage(context, state);
      }
    }, builder: (context, state) {
      if (state is RegisterLoading) {
        return const CustomLoadingIndicator();
      }
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(child: CustomTitle(text: 'Sign Up')),
              SizedBox(
                height: 85.h,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: key,
                  child: Column(
                    children: [
                      CustomTextField(
                        obsecure: false,
                        icon: Icons.check,
                        label: 'Username',
                        onSaved: (val) {
                          user = val;
                        },
                        onChanged: (val) {
                          setState(() {
                            errorMessage = false;
                          });
                        },
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        obsecure: true,
                        label: 'Password',
                        onSaved: (val) {
                          password = val;
                        },
                        onChanged: (val) {
                          setState(() {
                            errorMessage = false;
                          });
                        },
                        validator: (val) {
                          if (val == null || val.isEmpty || val.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        obsecure: false,
                          icon: Icons.check,
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
                            if (val == null ||
                                val.isEmpty ||
                                !val.contains('@')) {
                              return 'please enter a valid email';
                            }
                            return null;
                          }),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: SwitchW(
                  remember: remember,
                  title: 'Remember Me',
                  onChanged: updateRemember,
                ),
              ),
              SizedBox(
                height: 158.h,
              ),
              CustomButton(
                text: 'Sign Up',
                onTap: () {
                  if (key.currentState!.validate()) {
                    key.currentState!.save();

                    BlocProvider.of<RegisterCubit>(context)
                        .register(user!, email!, password!, remember);
                  }
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
