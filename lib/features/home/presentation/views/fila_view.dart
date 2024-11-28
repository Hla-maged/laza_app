import 'package:flutter/material.dart';
import 'widgets/fila_view_body.dart';

class FilaView extends StatelessWidget {
  const FilaView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FilaViewBody(),
    );
  }
}
