import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/features/app/controller/app_controller.dart';
import 'package:login_screen/features/app/ui/custom/custom_dialog.dart';
import 'package:login_screen/features/home/models/list_product_request.dart';
import 'package:login_screen/features/home/models/list_product_response.dart';
import 'package:login_screen/features/home/repository/list_product_repo.dart';
import 'package:dio/dio.dart';

class HomeController extends GetxController {
  final ListProductRepo homeRepo = Get.find();
  final isLoading = false.obs;
  final productList = <Product>[].obs;
  int currentPage = 1;
  final ScrollController scrollController = ScrollController();
  final appController = Get.find<AppController>();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    scrollController.addListener(_scrollListener);
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    super.onClose();
  }
  

  void _scrollListener() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 400) {
      loadMore();
    }
  }

  void logout() {
    appController.logout();
  }

  void navigateToCart() {
    Get.toNamed('/cart');
  }

  Future<void> fetchProducts({bool isLoadMore = false}) async {
    if (isLoading.value) return;
    try {
      isLoading.value = true;
      int tempPage = isLoadMore ? currentPage + 1 : 1;
      final response = await homeRepo.getListProduct(
        ListProductRequest(page: tempPage, limit: 10),
      );

      if (response.success && response.data.isNotEmpty) {
        if (isLoadMore) {
          productList.addAll(response.data);
          currentPage = tempPage;
        } else {
          productList.assignAll(response.data);
          currentPage = 1;
        }
      }
    } on DioException catch (e) {
      Get.dialog(CustomDialog(
        message:
            "Lỗi: ${e.response?.statusCode} - ${e.response?.statusMessage}",
      ));
    } catch (e) {
      Get.dialog(CustomDialog(message: "Đã xảy ra lỗi: ${e.toString()}"));
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadMore() async {
    await fetchProducts(isLoadMore: true);
  }

  Future<void> onRefresh() async {
    await fetchProducts();
  }
}
