import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:login_screen/screens/login_page.dart';
import 'package:login_screen/screens/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      // Kiểm tra trạng thái đăng nhập từ Hive box
      var loginBox = Hive.box('userBox');
      bool isLoggedIn = loginBox.get('isLoggedIn', defaultValue: false);

      // Chuyển hướng đến màn hình phù hợp
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => isLoggedIn ? const HomePage() : const LoginPage(),
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
