import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/features/detail_product/controller/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  const DetailProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chi tiết sản phẩm"), centerTitle: true),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.deleteProduct(controller.productId);
          },
          child: const Text("Xóa"),
        ),
      ),
    );
  }
}
