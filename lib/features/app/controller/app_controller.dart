import 'package:get/get.dart';
import 'package:login_screen/base/hive_service.dart';

class AppController extends GetxController {
  bool get isLoggedIn => HiveService.isLoggedIn;

  void logout() async {
    HiveService.setLoggedIn(false);
    await HiveService.clearCart();
    Get.offAllNamed('/login');
  }
}
