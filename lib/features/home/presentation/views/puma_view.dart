import 'package:flutter/material.dart';
import 'widgets/puma_view_body.dart';

class PumaView extends StatelessWidget {
  const PumaView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PumaViewBody(),
    );
  }
}
