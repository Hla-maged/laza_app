import 'package:flutter/material.dart';
import 'package:laza_app/features/auth/presentation/views/widgets/forgetpass_view_body.dart';
import 'widgets/custom_app_bar.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CustomAppBar(),
        ),
        body: const ForgetpassViewBody());
  }
}
