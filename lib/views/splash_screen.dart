import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/controllers/app_controller.dart';
import 'package:login_screen/views/home_page_screen.dart';
import 'package:login_screen/views/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _appController = Get.find<AppController>();

  @override
  void initState() {
    super.initState();
    navigatorNextScreen();
  }

  void navigatorNextScreen() async {
    print('${_appController.isLoggedIn}');
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(
        _appController.isLoggedIn ? const HomePage() : const LoginView(),
      );
    });
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
