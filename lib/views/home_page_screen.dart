import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/controllers/app_controller.dart';


class HomePage extends GetView<AppController> {
  const HomePage({super.key});

  void _logout() {
    controller.logout();
    Get.offAllNamed('/login');
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
