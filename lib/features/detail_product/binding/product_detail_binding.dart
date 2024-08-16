import 'package:get/get.dart';
import 'package:login_screen/features/detail_product/controller/product_detail_controller.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailController>(() => ProductDetailController(),
        fenix: true);
  }
}
