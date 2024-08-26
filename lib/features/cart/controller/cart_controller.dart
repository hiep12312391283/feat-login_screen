import 'package:get/get.dart';
import 'package:login_screen/base/hive_service.dart';
import 'package:login_screen/features/home/models/list_product_response.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadItems();
  }

  void loadItems() {
    cartItems.value = HiveService.getCartItems();
  }

  void clearItems() {
    HiveService.clearCart().then((_) {
      loadItems();
    });
  }

  void removeFromCart(int productId) {
    HiveService.deleteItems(productId).then((_) {
      loadItems();
    });
  }
}
