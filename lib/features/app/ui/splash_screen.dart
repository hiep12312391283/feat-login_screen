import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/features/app/controller/app_controller.dart';

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
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(_appController.isLoggedIn ? '/home' : '/login');
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
