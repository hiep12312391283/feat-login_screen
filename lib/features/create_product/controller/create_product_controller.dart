import 'package:get/get.dart';
import 'package:login_screen/features/create_product/models/create_product_request.dart';

class CreateProductController extends GetxController{
  var id = 0.obs;
  var name = ''.obs;
  var price = 0.obs;
  var quantity = 0.obs;
  var cover = ''.obs;

  // Phương thức để gửi yêu cầu tạo sản phẩm
  void createProduct() {
    final product = CreateProductRequest(
      id: id.value,
      name: name.value,
      price: price.value,
      quantity: quantity.value,
      cover: cover.value,
    );

    // Thực hiện gửi yêu cầu đến API hoặc xử lý tạo sản phẩm ở đây
    print('Tạo sản phẩm: ${product.name}');
  }
}