import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:login_screen/features/app/controller/app_controller.dart';
import 'package:login_screen/features/app/ui/custom/custom_dialog.dart';
import 'package:login_screen/features/home/models/list_product_request.dart';
import 'package:login_screen/features/home/models/list_product_response.dart';
import 'package:login_screen/features/home/repository/list_product_repo.dart';

class HomeController extends GetxController {
  final ListProductRepo homeRepo = Get.find();
  final isLoading = false.obs;
  final productList = <Product>[].obs;
  final currentPage = 1.obs;
  final ScrollController scrollController = ScrollController();
  final appController = Get.find<AppController>();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
    scrollController.addListener(_scrollListener);
  }

  void remove() {
    scrollController.dispose();
  }

  void _scrollListener() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 400 &&
        !isLoading.value) {
      loadMore();
    }
  }

  void logout() {
    appController.logout();
  }

  void navigateToCart() {
    Get.offAllNamed('/cart');
  }

  Future<void> fetchProducts() async {
    if (isLoading.value) return;

    try {
      isLoading(true);
      final response = await homeRepo.getListProduct(
          ListProductRequest(page: currentPage.value, limit: 10));
      if (response.success && response.data.isNotEmpty) {
        productList.addAll(response.data);
        currentPage.value++;
      }
    } catch (e) {
      Get.dialog(const CustomDialog(message: 'Đã xảy ra lỗi'));
      e.toString();
    } finally {
      isLoading(false);
    }
  }

  Future<void> loadMore() async {
    if (!isLoading.value) {
      fetchProducts();
    }
  }

  Future<void> onRefresh() async {
    currentPage.value = 1;
    productList.clear();
    fetchProducts();
  }
}
