import 'package:flutter/material.dart';
import 'package:laza_app/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView(
      {super.key,
      required this.toggleTheme,
      required this.user,
      required this.email});
  final String user, email;
  final VoidCallback toggleTheme;

  @override
  Widget build(BuildContext context) {
    print(user);
    print(email);
    return Scaffold(
        appBar: AppBar(
          leading: const CustomAppBar(),
        ),
        body: SignInViewBody(
          toggleTheme: toggleTheme,
          email: email,
          user: user,
        ));
  }
}
