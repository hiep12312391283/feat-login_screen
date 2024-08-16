import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/features/detail_product/controller/product_detail_controller.dart';

class ProductDetail extends GetView<ProductDetailController> {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Chi tiết sản phẩm'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Get.offAllNamed('/home');
              },
              icon: const Icon(Icons.arrow_back_ios_new_sharp))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.logout();
        },
        child: const Icon(Icons.exit_to_app),
      ),
    );
  }
}
