import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/controllers/app_controller.dart';
import 'package:login_screen/views/login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _logout() {
    final AppController appController = Get.find<AppController>();
    appController.logout();
    Get.offAll(() => const LoginView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: _logout,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
        child: const Text(
          'Đăng xuất',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ));
  }
}
