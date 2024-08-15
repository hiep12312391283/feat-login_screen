import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/features/app/controller/app_controller.dart';
import 'package:login_screen/features/home/controller/home_page_controller.dart';

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
        if (homeController.isLoading.value &&
            homeController.productList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (homeController.productList.isEmpty) {
          return const Center(child: Text('Không có sản phẩm'));
        } else {
          return RefreshIndicator(
            onRefresh: homeController.refresh,
            child: ListView.builder(
              controller: homeController.scrollController,
              itemCount: homeController.productList.length +
                  (homeController.canLoadMore.value ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < homeController.productList.length) {
                  final product = homeController.productList[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text('\$${product.price}'),
                    leading: Image.network(product.cover),
                  );
                } else if (homeController.canLoadMore.value) {
                  // homeController.loadMore();
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          );
        }
      }),
    );
  }
}
