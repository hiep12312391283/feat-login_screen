import 'package:flutter/material.dart';
import 'package:login_screen/models/user_repository.dart';
import 'package:login_screen/screens/login_page.dart';
import 'package:login_screen/screens/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      // var loginBox = Hive.box('userBox');
      // bool isLoggedIn = loginBox.get('isLoggedIn', defaultValue: false);
      bool isLoggedIn = UserRepository.isLoggedIn;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              isLoggedIn ? const HomePage() : const LoginPage(),
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
