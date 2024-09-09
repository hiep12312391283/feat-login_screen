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
          if (controller.productId != null)
            IconButton(
              onPressed: () {
                controller.deleteProduct(controller.productId!);
              },
              icon: const Icon(Icons.delete),
            ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: controller.formKey,
            autovalidateMode: controller.validateMode.value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (controller.productId != null &&
                    controller.product.value != null)
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Image.network(
                      controller.product.value!.cover,
                      fit: BoxFit.contain,
                    ),
                  ),
                const SizedBox(height: 16),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: controller.coverController,
                  decoration: const InputDecoration(labelText: 'URL hình ảnh'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'URL hình ảnh không được để trống';
                    }
                    final uri = Uri.tryParse(value);
                    if (uri == null || !uri.isAbsolute) {
                      return 'URL hình ảnh không hợp lệ';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: controller.nameController,
                  decoration: const InputDecoration(labelText: 'Tên sản phẩm'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tên sản phẩm không được để trống';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: controller.quantityController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(labelText: 'Số lượng'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Số lượng không được để trống';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: controller.priceController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(labelText: 'Giá tiền'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Giá tiền không được để trống';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                Center(
                    child: ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (controller.productId == null) {
                      controller.createProduct();
                    } else {
                      controller.updateProduct();
                    }
                  },
                  child:
                      Text(controller.productId == null ? 'Lưu' : 'Cập nhật'),
                )),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      }),
    );
  }
}
