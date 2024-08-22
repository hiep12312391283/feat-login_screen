import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: controller.coverController,
                      decoration:
                          const InputDecoration(labelText: 'URL hình ảnh'),
                    ),
                    TextFormField(
                      controller: controller.nameController,
                      decoration:
                          const InputDecoration(labelText: 'Tên sản phẩm'),
                    ),
                    TextFormField(
                      controller: controller.quantityController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: const InputDecoration(labelText: 'Số lượng'),
                    ),
                    TextFormField(
                      controller: controller.priceController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: const InputDecoration(labelText: 'Giá tiền'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            controller.updateProduct();
                          },
                          child: const Text('Cập nhật')),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ],
            ),
          );
        }));
  }
}
