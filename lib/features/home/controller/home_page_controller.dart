import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:login_screen/features/home/models/home_response.dart';
import 'package:login_screen/features/home/repository/home_repo.dart';

class HomeController extends GetxController {
  final HomeRepo homeRepo = Get.find();
  RxBool isLoading = false.obs;
  final productList = <Product>[].obs;
  final currentPage = 1.obs;
  final canLoadMore = true.obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (canLoadMore.value) {
        loadMore();
      }
    }
  }

  Future<void> fetchProducts() async {
    if (!canLoadMore.value || isLoading.value) return;
    try {
      isLoading(true);
      final response =
          await homeRepo.getHomeData(page: currentPage.value, limit: 10);
      if (response.success) {
        var newProducts = response.data;

        if (newProducts.isEmpty) {
          canLoadMore(false);
        } else {
          productList.addAll(newProducts);
          currentPage.value++;
        }
      } else {
        canLoadMore(false);
      }
    } catch (e) {
      canLoadMore(false);
    } finally {
      isLoading(false);
    }
  }

  Future<void> loadMore() async {

    if (!canLoadMore.value || isLoading.value) return;
    fetchProducts();
  }

  @override
  Future<void> refresh() async {
    currentPage.value = 1;
    productList.clear();
    canLoadMore(true);
    fetchProducts();
  }
}
