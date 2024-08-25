import 'package:get/get.dart';
import 'package:login_screen/base/hive_service.dart';

class CartController extends GetxController {
  var cartItem = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadItems();
  }

  void loadItems() {
    cartItem.value = HiveService.getCartItems();
  }

  void clearItems() async {
    await HiveService.clearCart();
    loadItems();
  }

  void removeFromCart(int productId) async {
    await HiveService.deleteItems(productId);
    loadItems();
  }

  void backHome() {
    Get.back(result: 'back');
  }
}
