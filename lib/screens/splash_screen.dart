import 'package:flutter/material.dart';
import 'package:login_screen/providers/app_provider.dart';
import 'package:login_screen/screens/login_page.dart';
import 'package:login_screen/screens/home_page.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      final appProvider = context.read<AppProvider>();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              appProvider.isLoggedIn ? const HomePage() : const LoginPage(),
        ),
      );
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
