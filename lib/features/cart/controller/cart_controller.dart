import 'package:get/get.dart';
import 'package:login_screen/base/hive_service.dart';
import 'package:login_screen/features/home/models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadItems();
  }

  void loadItems() {
    cartItems.value = HiveService.getCartItem();
  }

  void clearItems() async {
    await HiveService.clearCart();
    loadItems();
  }

  void removeFromCart(int productId) async {
    await HiveService.deleteItem(productId);
    loadItems();
  }
}
