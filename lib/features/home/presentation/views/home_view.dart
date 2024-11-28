import 'package:flutter/material.dart';
import 'package:laza_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'widgets/sider_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView(
      {super.key,
      required this.toggleTheme,
      required this.user,
      required this.email});
  final VoidCallback toggleTheme;
  final String user, email;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                toggleTheme();
              },
              icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            ),
          )
        ],
      ),
      drawer: SideDrawer(
        email: email,
        user: user,
      ),
      body: const HomeViewBody(),
    );
  }
}
