import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/features/app/ui/custom/custom_dialog.dart';
import 'package:login_screen/features/detail_product/repository/detail_product_repo.dart';
import 'package:login_screen/features/home/models/list_product_response.dart';

class DetailProductController extends GetxController {
  final DetailProductRepo detailProductRepo = Get.find();
  final isLoading = false.obs;
  var product = Rxn<Product>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController coverController = TextEditingController();
  late final int productId;
  final formKey = GlobalKey<FormState>();
  final validateMode = AutovalidateMode.always.obs;

  @override
  void onInit() {
    super.onInit();
    productId = Get.arguments as int;
  }

  @override
  void onReady() async {
    await fetchProducts(productId);
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    priceController.dispose();
    quantityController.dispose();
    coverController.dispose();
  }

  Future<void> deleteProduct(int productId) async {
    final response = await detailProductRepo.deleteProduct(productId);
    if (response.success) {
      Get.back(result: 'updated');
      Get.snackbar("Thành công", response.message);
    } else {
      Get.snackbar("Lỗi", response.message);
    }
  }

  Future<void> fetchProducts(int productId) async {
    try {
      isLoading.value = true;
      final response = await detailProductRepo.fetchDetailProduct(productId);
      if (response.success) {
        product.value = response.product;
        nameController.text = response.product.name;
        priceController.text = response.product.price.toString();
        quantityController.text = response.product.quantity.toString();
        coverController.text = response.product.cover;
      } else {
        Get.snackbar("Lỗi", response.message);
      }
    } catch (e) {
      Get.dialog(CustomDialog(message: "Đã xảy ra lỗi: ${e.toString()}"));
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateProduct() async {
    try {
      final updatedProduct = Product(
        id: productId,
        name: nameController.text,
        price: int.tryParse(priceController.text) ?? 0,
        quantity: int.tryParse(quantityController.text) ?? 0,
        cover: coverController.text,
      );
      final response = await detailProductRepo.updateProducts(updatedProduct);
      if (formKey.currentState!.validate()) {
        if (response.success) {
          Get.back(result: 'updated');
          Get.snackbar("Thành công", "Sản phẩm đã được cập nhật");
        } else {
          Get.snackbar("Lỗi", response.message);
        }
      }
    } catch (e) {
      Get.dialog(CustomDialog(message: "Đã xảy ra lỗi: ${e.toString()}"));
    }
  }
}
