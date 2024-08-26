import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/features/cart/controller/cart_controller.dart'; // Điều chỉnh theo project của bạn

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Giỏ hàng'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back(result: 'back');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Obx(() {
            if (controller.cartItem.isNotEmpty) {
              return IconButton(
                icon: const Icon(Icons.delete_forever),
                onPressed: () {
                  controller.clearItems();
                },
              );
            } else {
              return Container();
            }
          }),
        ],
      ),
      body: Obx(() {
        if (controller.cartItem.isEmpty) {
          return const Center(child: Text('Giỏ hàng trống'));
        } else {
          return ListView.builder(
            itemCount: controller.cartItem.length,
            itemBuilder: (context, index) {
              final item = controller.cartItem[index];
              return ListTile(
                leading: item['cover'] != null
                    ? Image.network(
                        item['cover'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.image_not_supported, size: 50),
                title: Text(item['name'] ?? 'Tên sản phẩm'),
                subtitle: Text(
                  '\$${item['price']}',
                ),
                trailing: Obx(() {
                  if (controller.cartItem.isNotEmpty) {
                    return IconButton(
                      onPressed: () {
                        int productId = item['id'] ?? -1;
                        if (productId != -1) {
                          controller.removeFromCart(productId);
                        }
                      },
                      icon: const Icon(Icons.delete),
                    );
                  } else {
                    return Container();
                  }
                }),
              );
            },
          );
        }
      }),
    );
  }
}
