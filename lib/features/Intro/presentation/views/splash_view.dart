import 'package:flutter/material.dart';
import 'package:laza_app/constants.dart';

import 'welcome_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key, required this.toggleTheme});
  final VoidCallback toggleTheme;

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateToWelocme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Image.asset('assets/images/Logo.png'),
      ),
    );
  }

  void navigateToWelocme() {
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomeView(toggleTheme: widget.toggleTheme),
        ),
      );
    });
  }
}
