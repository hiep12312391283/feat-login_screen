import 'package:get/get.dart';
import 'package:login_screen/features/create_product/controller/create_product_controller.dart';

class CreateProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateProductController>(()=> CreateProductController());
  }
}
