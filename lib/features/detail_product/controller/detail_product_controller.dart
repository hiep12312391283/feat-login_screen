import 'package:get/get.dart';
import 'package:login_screen/features/detail_product/models/detail_product_request.dart';
import 'package:login_screen/features/detail_product/repository/detail_product_repo.dart';

class DetailProductController extends GetxController {
  final DetailProductRepo detailProductRepo = Get.find();
  final productId = Get.arguments as int;

  Future<void> deleteProduct(int productId) async {
    final request = DetailProductRequest(id: productId);
    try {
      final response = await detailProductRepo.deleteProduct(request);
      if (response.success) {
        Get.snackbar("Thành công", response.message);
        Get.offAllNamed('/home');
      } else {
        Get.snackbar("Lỗi", response.message);
      }
    } catch (e) {
      Get.snackbar("Lỗi", "Không tìm thấy sản phẩm");
      print("Error deleting product: $e");
    }
  }
}
