import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/controllers/app_controller.dart';

import 'package:login_screen/models/hive_service.dart';

class HomePage extends GetView<AppController> {
  HomePage({super.key});

  void _logout() {
    controller.logout();
    Get.offAllNamed('/login');
  }

  final token = HiveService.getToken();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(bottom: 10, left: 20),
            child: const Text(
              'Danh sách',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  _logout();
                },
                icon: const Icon(Icons.exit_to_app_sharp)),
            IconButton(
                onPressed: () {
                  // Get.offNamed('/productDetail');
                  print('Thêm sản phẩm');
                },
                icon: const Icon(Icons.add)),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                print('Giỏ hàng');
              },
            ),
          ],
        ),
        body: Center());
  }
}
