import 'package:flutter/material.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key, required this.toggleTheme});
  final VoidCallback toggleTheme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomAppBar(),
      ),
      body: SignUpViewBody(
        toggleTheme: toggleTheme,
      ),
    );
  }
}
