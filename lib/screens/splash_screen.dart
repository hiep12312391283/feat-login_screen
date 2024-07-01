import 'package:flutter/material.dart';
import 'package:login_screen/providers/app_provider.dart';
import 'package:login_screen/screens/login_page.dart';
import 'package:login_screen/screens/home_page.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final _appProvider = context.read<AppProvider>();
  void navigatorNextScreen() async {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              _appProvider.isLoggedIn ? const HomePage() : const LoginPage(),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    navigatorNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
