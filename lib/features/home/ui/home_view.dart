import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/features/home/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

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
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.offAllNamed('/create_product');
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              controller.navigateToCart();
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.productList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.productList.isEmpty) {
          return const Center(child: Text('Không có sản phẩm'));
        } else {
          return RefreshIndicator(
            onRefresh: controller.onRefresh,
            child: ListView.builder(
              controller: controller.scrollController,
              itemCount: controller.productList.length + 1,
              itemBuilder: (context, index) {
                if (index < controller.productList.length) {
                  final product = controller.productList[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text('\$${product.price}'),
                    leading: Image.network(product.cover),
                    onTap: () {
                      int productId = product.id;
                      Get.toNamed('/detail', arguments: product.id);
                    },
                    trailing: IconButton(
                      icon: const Icon(Icons.add_shopping_cart_rounded),
                      onPressed: () {
                        Get.snackbar(
                          'Thành công',
                          '${product.name} đã được thêm vào giỏ hàng!',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.logout();
        },
        child: const Icon(Icons.exit_to_app),
      ),
    );
  }
}
