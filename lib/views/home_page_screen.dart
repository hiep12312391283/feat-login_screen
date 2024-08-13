import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/controllers/app_controller.dart';
import 'package:login_screen/controllers/home_page_controller.dart';

class HomePage extends GetView<AppController> {
  HomePage({super.key});

  final HomeController homeController = Get.put(HomeController());

  void _logout() {
    controller.logout();
    Get.offAllNamed('/login');
  }

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
            icon: const Icon(Icons.exit_to_app_sharp),
          ),
          IconButton(
            onPressed: () {
              // Navigate to the product detail page or other action
              print('Thêm sản phẩm');
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              print('Giỏ hàng');
            },
          ),
        ],
      ),
      body: Obx(() {
        if (homeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (homeController.products.isEmpty) {
          return const Center(child: Text('Không có sản phẩm'));
        } else {
          return ListView.builder(
            itemCount: homeController.products.length,
            itemBuilder: (context, index) {
              final product = homeController.products[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text('\$${product.price}'),
                onTap: () {
                  print('Tapped on ${product.name}');
                },
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeController.fetchProducts();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
