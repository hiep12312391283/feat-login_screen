import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/features/cart/controller/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ hàng'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed('/home');
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.logout();
        },
        child: const Icon(Icons.exit_to_app),
      ),
    );
  }
}
