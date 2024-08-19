import 'package:get/get.dart';
import 'package:login_screen/features/detail_product/controller/detail_product_controller.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProductController>(() => DetailProductController());
  }
}
