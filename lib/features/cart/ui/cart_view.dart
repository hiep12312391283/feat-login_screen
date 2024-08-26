import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/features/cart/controller/cart_controller.dart';

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
            return controller.cartItems.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.delete_forever),
                    onPressed: () {
                      controller.clearItems();
                    },
                  )
                : const SizedBox();
          }),
        ],
      ),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return const Center(child: Text('Giỏ hàng trống'));
        } else {
          return ListView.builder(
            itemCount: controller.cartItems.length,
            itemBuilder: (context, index) {
              final item = controller.cartItems[index];
              return ListTile(
                leading: item.cover.isNotEmpty
                    ? Image.network(
                        item.cover,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.image_not_supported, size: 50),
                title: Text(item.name.isNotEmpty ? item.name : 'Tên sản phẩm'),
                subtitle: Text(
                  '\$${item.price}',
                ),
                trailing: IconButton(
                  onPressed: () {
                    controller.removeFromCart(item.id);
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
