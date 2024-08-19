import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/features/create_product/controller/create_product_controller.dart';

class CreateProductScreen extends GetView<CreateProductController> {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm Sản Phẩm'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed('/home');
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'ID'),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    controller.id.value = int.tryParse(value) ?? 0,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Tên'),
                onChanged: (value) => controller.name.value = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Giá'),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    controller.price.value = int.tryParse(value) ?? 0,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Số lượng'),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    controller.quantity.value = int.tryParse(value) ?? 0,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Ảnh đại diện URL'),
                onChanged: (value) => controller.cover.value = value,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => controller.createProduct(),
                child: const Text('Tạo Sản Phẩm'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
