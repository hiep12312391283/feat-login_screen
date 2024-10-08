import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/base/hive_service.dart';
import 'package:login_screen/features/home/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
              controller.navigateToDetail();
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
                  final isInCart = HiveService.isProductInCart(product.id);
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              controller.navigateToDetail(
                                  productId: product.id);
                            },
                            child: Row(
                              children: [
                                Image.network(
                                  product.cover,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(product.name,
                                          style: const TextStyle(fontSize: 16)),
                                      Text('\$${product.price}',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add_shopping_cart_rounded,
                            color: isInCart ? Colors.grey : Colors.blue,
                          ),
                          onPressed: isInCart
                              ? null
                              : () {
                                  controller.addToCart(product);
                                },
                        ),
                      ],
                    ),
                  );
                } else {
                  return controller.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox.shrink();
                }
              },
            ),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
            title: 'Xác nhận',
            middleText: 'Bạn có muốn đăng xuất không?',
            textCancel: 'Hủy',
            textConfirm: 'Đăng xuất',
            onConfirm: () {
              controller.logout();
              Get.back();
            },
          );
        },
        child: const Icon(Icons.exit_to_app),
      ),
    );
  }
}
