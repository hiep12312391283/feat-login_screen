import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/features/detail_product/controller/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  const DetailProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Chi tiết sản phẩm"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  controller.deleteProduct(controller.productId);
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final product = controller.product.value;
          if (product == null) {
            return const Center(
              child: Text('Không có sản phẩm để hiển thị'),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              product.cover.isNotEmpty
                  ? SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Image.network(
                        product.cover,
                        fit: BoxFit.contain,
                      ),
                    )
                  : SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: const Center(child: Text("Không có hình ảnh")),
                    ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ID sản phẩm: ${product.id}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Text('Tên sản phẩm: ${product.name}'),
                      const SizedBox(height: 16),
                      Text('Giá: ${product.price.toString()} VND'),
                      const SizedBox(height: 16),
                      Text('Số lượng: ${product.quantity.toString()}'),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          );
        }));
  }
}
