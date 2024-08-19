import 'package:get/get.dart';
import 'package:login_screen/features/detail_product/controller/detai_product_controller.dart';

class DetailProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DetaiProductController>(() => DetaiProductController());
  }
}