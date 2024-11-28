import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/features/auth/presentation/manager/LoginCubit/login_cubit.dart';
import '../../../../../core/helper/widgets/custom_error.dart';
import '../../../../../core/helper/widgets/loading_indicator.dart';
import '../../../../home/presentation/views/bottom_navigation_view.dart';
import 'custom_button.dart';
import 'custom_text_feild.dart';
import 'custom_title.dart';
import 'switch.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody(
      {super.key,
      required this.toggleTheme,
      required this.user,
      required this.email});
  final String user, email;
  final VoidCallback toggleTheme;

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  String? password, email;
  bool errorMessage = false, remember = false;

  bool updateRemember(bool val) {
    setState(() {
      remember = val;
    });

    return remember;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => BottomNavigationView(
                        toggleTheme: widget.toggleTheme,
                        user: widget.user,
                        email: widget.email,
                      )));
          print('sign in');
          print(widget.user);
          print(widget.email);
        } else if (state is LoginFailure) {
          CustomError.errorMessage(context, state);
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const CustomLoadingIndicator();
        }
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Center(child: CustomTitle(text: 'Welcome')),
                const Center(
                    child: Text(
                  'Please enter your data to continue',
                  style: TextStyle(color: Colors.grey),
                )),
                SizedBox(
                  height: 80.h,
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
                          label: 'Email',
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
                            if (val == null || val.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'forgotPass');
                          },
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(color: Colors.red),
                          )),
                    )
                  ],
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
                  height: 130.h,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: Center(
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 14.sp),
                              children: [
                                TextSpan(
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                  text:
                                      'By connecting your account confirm that you agree\n with our ',
                                ),
                                TextSpan(
                                    text: 'Term and Condition',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ))
                              ]))),
                ),
                CustomButton(
                  onTap: () {
                    if (key.currentState!.validate()) {
                      key.currentState!.save();

                      BlocProvider.of<LoginCubit>(context)
                          .login(email!, password!, remember);
                    }
                  },
                  text: 'Login',
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
