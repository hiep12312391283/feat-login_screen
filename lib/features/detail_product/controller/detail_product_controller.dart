import 'package:get/get.dart';
import 'package:login_screen/features/detail_product/repository/detail_product_repo.dart';
import 'package:login_screen/features/home/models/list_product_response.dart';

class DetailProductController extends GetxController {
  final DetailProductRepo detailProductRepo = Get.find();
  final productId = Get.arguments as int;
  final isLoading = false.obs;
  var product = Rxn<Product>();

  @override
  void onInit() {
    super.onInit();
    fetchProducts(productId);
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
      } else {
        Get.snackbar("Lỗi", response.message);
      }
    } catch (e) {
      throw Exception();
    } finally {
      isLoading.value = false;
    }
  }
}
