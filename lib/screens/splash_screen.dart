import 'package:flutter/material.dart';
import 'package:login_screen/providers/user_provider.dart';
import 'package:login_screen/screens/login_page.dart';
import 'package:login_screen/screens/home_page.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      // bool loadScreen = UserRepository.isLoggedIn;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              userProvider.isLoggedIn ? const HomePage() : const LoginPage(),
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
